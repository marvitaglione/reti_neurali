import torch
import binarize as bin
import util

class BinarizeLayer(torch.nn.Module):

    def __init__(self, binFunction):

        super(BinarizeLayer, self).__init__()
        self.binFunction = binFunction

    def forward(self, x):
        return self.binFunction(x)

class BinarizeLayer2Level(torch.nn.Module):

    def __init__(self, output_size, device="cpu"):

        super(BinarizeLayer2Level, self).__init__()
        self.binFunction = bin.binarize2Level

        self.device = device

        self.gamma = torch.empty(2, 1, output_size, device=device)
        torch.nn.init.uniform_(self.gamma)
        self.gamma = torch.nn.Parameter(self.gamma)


    def forward(self, x):
        res_bin = self.binFunction(x, self.gamma)
        # res = bin.Binarize2Level2D.bin2Val(res_bin, self.gamma)
        return res_bin[0] * self.gamma[0] + res_bin[1] * self.gamma[1]

class BinarizeLayer2Level2D(torch.nn.Module):

    def __init__(self, output_size, device="cpu"):

        super(BinarizeLayer2Level2D, self).__init__()
        self.binFunction = bin.binarize2Level2D

        self.device = device

        self.gamma = torch.empty(2, 1, output_size, 1, 1, device=device)
        torch.nn.init.uniform_(self.gamma)
        self.gamma = torch.nn.Parameter(self.gamma)


    def forward(self, x):
        res_bin = self.binFunction(x, self.gamma)
        # res = bin.Binarize2Level2D.bin2Val(res_bin, self.gamma)
        return res_bin[0] * self.gamma[0] + res_bin[1] * self.gamma[1]


class LinearBin(torch.nn.Module):

    def __init__(self, weight, bias=None, binFunction=bin.binarize101, threshold=0, device="cpu"):

        super(LinearBin, self).__init__()

        self.weight = torch.nn.Parameter(weight)
        self.bias = None
        if bias != None:
            self.bias = torch.nn.Parameter(bias)
        self.threshold = threshold

        # Layers
        self.bl = binFunction


    def forward(self, x):

        # Binarizzazione dei pesi
        old = bin.Binarize101.threshold
        bin.Binarize101.threshold = self.threshold
        wb = self.bl(self.weight)
        bin.Binarize101.threshold = old

        #---------- FOR REPORT
        # weights = [[x for x in lista if x != 0] for lista in wb.int().tolist()]
        # util.report(f"------\nWeights exit\n{weights}\n")

        # Calcolo output
        return torch.nn.functional.linear(x, wb, self.bias)

    def setThreshold(self, threshold):
        self.threshold = threshold


class BatchNorm1D(torch.nn.Module):

    def __init__(self, input_size, weight=None, bias=None, device="cpu"):

        super(BatchNorm1D, self).__init__()

        self.device = device

        # Liste che contengono la media e la varianza di ogni feature per ogni batch
        self.EPList = []        
        self.VarPList = []

        if weight == None:
            self.gamma = torch.empty(1, device=device)
            torch.nn.init.uniform_(self.gamma)
            self.gamma = torch.nn.Parameter(self.gamma)
        else:
            self.gamma = torch.nn.Parameter(weight)
            
        if bias == None:
            self.beta = torch.zeros(input_size, device=device)
            self.beta = torch.nn.Parameter(self.beta)
        else:
            self.beta = torch.nn.Parameter(bias)

        # Statistiche della popolazione da settare per l'inferenza
        self.EP = torch.nn.Parameter(torch.empty(input_size, device=device), requires_grad=False)
        self.VarP = torch.nn.Parameter(torch.empty(input_size, device=device), requires_grad=False)       

        # Settare self.inference = True prima della fase di inferenza in modo da utilizzare i parametri
        # della popolazione. Reimpostarlo a False prima della fase di training.    
        self.inference = False

    def forward(self, x):

        # Algoritmo del paper
        eps = 1e-5
        
        if self.inference:

            # b_num = self.EP * self.gamma
            # b_den = torch.sqrt(self.VarP + eps).pow_(-1)
            # b = self.beta - b_num * b_den
            # w = self.gamma * torch.sqrt(self.VarP + eps).pow_(-1) 
            # # y =  w * x + b           # Moltiplicazione -> shift register (mul per potenza 2)
            # y = (bin.AP2(w) * x).floor_() + b.floor_()
            y = (bin.AP2(self.gamma) / bin.AP2(torch.sqrt(self.VarP + eps)) * x).floor() - (self.EP * bin.AP2(self.gamma) /  bin.AP2(torch.sqrt(self.VarP + eps)) - self.beta).round()

        else:
                
            mu = torch.mean(x, dim=0)   # Media per colonna (media delle uscite di un percettrone sul mini-batch)
            c = x - mu
            var = torch.sum(c * bin.AP2(c), dim=0) / len(x) 
            z = c * bin.AP2(torch.sqrt(var + eps).pow(-1))
            y = bin.AP2(self.gamma) * z + self.beta
            # var = torch.var(x, dim=0)
            # z = (x - mu) / torch.sqrt(var + eps)
            # y = self.gamma * z + self.beta

            # Salvataggio dei valori per il calcolo della statistica della popolazione
            self.EPList.append(mu.detach_())
            self.VarPList.append(var.detach_())
            
        return y

    def frozeParameters(self, batch_size):

        # Calcola i parametri della popolazione a partire dai parametri dei batch memorizzati durante il forward 
        # nelle variabili EPList e VarPList.
        # Va invocato dopo aver terminato la fase di traning.

        del self.EP
        del self.VarP

        eP = torch.stack(self.EPList, dim=0).to(self.device)
        varP = torch.stack(self.VarPList, dim=0).to(self.device)

        self.EP = torch.nn.Parameter(torch.mean(eP, dim=0), requires_grad=False)
        self.VarP = torch.nn.Parameter(torch.mean(varP, dim=0).mul_(batch_size / (batch_size - 1)), requires_grad=False)

        self.EPList.clear()
        self.VarPList.clear()

    def getParameter(self):

        # Restituzione di a e b del livello di batchnorm.
        # a è una potenza di 2.
        # b è un intero approssimato per difetto. 

        eps = 1e-5
        # b_num = self.EP * self.gamma
        # b_den = torch.sqrt(self.VarP + eps).pow_(-1)
        # b = self.beta - b_num * b_den
        # w = self.gamma * torch.sqrt(self.VarP + eps).pow_(-1) 
        # b = b.floor_()
        # return bin.AP2(w), b            # Moltiplicazione -> shift register (mul per potenza 2)

        a = bin.AP2(self.gamma) / bin.AP2(torch.sqrt(self.VarP + eps))
        b = - (self.EP * bin.AP2(self.gamma) /  bin.AP2(torch.sqrt(self.VarP + eps)) - self.beta).round()
        return a, b
        

# ------------------------------------------------
# For convolutional model

class ConvBinLayer(torch.nn.Module):

    def __init__(self, weights, device="cpu", binfunction=bin.binarize101):

        super(ConvBinLayer, self).__init__()

        self.device = device

        # weights (size_out x size_in x kernel_size)
        self.weights = torch.nn.Parameter(weights)

        self.bl = BinarizeLayer(binfunction)

    def forward(self, x):

        # Livello di binarizzazione dei pesi
        wb = self.bl(self.weights)        

        # Convoluzione
        return torch.nn.functional.conv2d(x, wb)

class BatchNorm2D(torch.nn.Module):

    def __init__(self, weight, bias, device="cpu"):

        super(BatchNorm2D, self).__init__()

        self.device = device

        # Liste che contengono la media e la varianza di ogni feature per ogni batch
        self.EPList = []
        self.VarPList = []

        # Parametri di training
        self.gamma = torch.nn.Parameter(weight.reshape(1,-1,1,1))
        self.beta = torch.nn.Parameter(bias.reshape(1,-1,1,1))
    
        
        # Statistiche della popolazione da settare per l'inferenza
        num_features = len(weight)
        self.EP = torch.nn.Parameter(torch.empty(num_features, device=self.device), requires_grad=False)
        self.VarP = torch.nn.Parameter(torch.empty(num_features, device=self.device), requires_grad=False) 

        self.moving_mean = torch.zeros(1,num_features,1,1, device=device)
        self.moving_var = torch.ones(1,num_features,1,1, device=device)
        self.momentum = 0.1

        # Settare self.inference = True prima della fase di inferenza in modo da utilizzare i parametri
        # della popolazione. Reimpostarlo a False prima della fase di training.    
        self.inference = False


    def forward(self, x):

        eps = 1e-5

        if not torch.is_inference_mode_enabled():

            y = self.gamma * (x - self.moving_mean) / torch.sqrt(self.moving_var + eps) + self.beta   # Scale and shift
            # y = self.gamma / torch.sqrt(self.moving_var + eps) * x - self.gamma * self.moving_mean / torch.sqrt(self.moving_var + eps) + self.beta 

        else:

            # Calcolo della media per ogni filtro (su tutto il filtro) su tutto il batch
            mu =  x.mean(dim=(0,2,3), keepdim=True).detach()
            var = x.var(dim=(0,2,3), keepdim=True).detach()

            z = (x  - mu) / torch.sqrt(var + eps)
            y = self.gamma * z + self.beta
            # y = self.gamma / torch.sqrt(var + eps) * x - self.gamma * mu / torch.sqrt(var + eps) + self.beta 

            self.EPList.append(mu.reshape(-1))
            self.VarPList.append(var.reshape(-1))

            self.moving_mean = (1.0 - self.momentum) * self.moving_mean + self.momentum * mu
            self.moving_var = (1.0 - self.momentum) * self.moving_var + self.momentum * var
            
        return y

    def frozeParameters(self, batch_size):
        return
        del self.EP
        del self.VarP

        eP = torch.stack(self.EPList, dim=0).to(self.device)
        varP = torch.stack(self.VarPList, dim=0).to(self.device)

        self.EP = torch.nn.Parameter(torch.mean(eP, dim=0), requires_grad=False)
        self.VarP = torch.nn.Parameter(torch.mean(varP, dim=0).mul_(batch_size / (batch_size - 1)), requires_grad=False)

        self.EPList.clear()
        self.VarPList.clear()
