import torch
import util as util

# Funzione di binarizzazione (-1, 1)
class Binarize11(torch.autograd.Function):

    @staticmethod
    def forward(ctx, x):
        ctx.save_for_backward(x)
        return torch.where(torch.ge(x, 0), 1., -1.)

    @staticmethod
    def backward(ctx, grad_output):
        x, = ctx.saved_tensors
        return torch.where(torch.abs(x).le(1), grad_output, 0) 
        #return torch.nn.functional.hardtanh(grad_output)
        
binarize11 = Binarize11.apply
# -----------------------------------------------------

# Funzione di binarizzazione (0, 1)
class Binarize01(torch.autograd.Function):

    @staticmethod
    def forward(ctx, x):
        return torch.where(torch.ge(x, 0), 1., 0.)

    @staticmethod
    def backward(ctx, grad_output):
        return torch.nn.functional.hardtanh(grad_output)
        
binarize01 = Binarize01.apply
# -----------------------------------------------------

# Funzione di binarizzazione (-1, 0, 1)
class Binarize101(torch.autograd.Function):

    threshold = 0

    @staticmethod
    def forward(ctx, x):
        ctx.save_for_backward(x)
        out = torch.where(torch.ge(torch.abs(x), Binarize101.threshold), x, 0.)
        out = torch.where(torch.gt(out, 0), 1., out)
        out = torch.where(torch.lt(out, 0), -1., out)
        return out

    @staticmethod
    def backward(ctx, grad_output):
        x, = ctx.saved_tensors
        return torch.where(torch.abs(x).le(1), grad_output, 0) 
        # return torch.nn.functional.hardtanh(grad_output)
        
binarize101 = Binarize101.apply

#--------------------------------------------
# Funzione di binarizzazione multilivello
class Binarize2Level(torch.autograd.Function):

    # Arrotondamento per difetto dei gamma solontanto in fase di inferenze 
    # Non in fase di training, altrimenti non impara
    # AP2 soltanto durante il training di pruning ed inferenza.


    @staticmethod
    def forward(ctx, x, gamma):
        out  = torch.empty(2, x.shape[0], x.shape[1], device=x.device)
        r = torch.empty(2, x.shape[0], x.shape[1], device=x.device)

        out0 = torch.empty(x.shape, device=x.device)
        out1 = torch.empty(x.shape, device=x.device)

        out0 = torch.where(torch.ge(x, 0), 1, -1)

        r[0] = x - out0 * gamma[0] 

        out1 = torch.where(torch.ge(r[0], 0), 1, -1)
 
        r[1] = r[0] - out1 * gamma[1] 

        ctx.save_for_backward(gamma, r)

        out[0] = out0
        out[1] = out1
        return out

    @staticmethod
    def backward(ctx, grad_output):
        
        gamma, r = ctx.saved_tensors

        add1 = torch.where(torch.le(torch.abs(r[0]), 1), gamma[0], 0)
        add2 = torch.where(torch.le(torch.abs(r[1]), 1), gamma[1], 0)
        grad_out_x = grad_output * (add1 + add2)

        grad_out_g = grad_output * torch.where(torch.ge(r, 0), 1, 0)
        grad_out_g = grad_out_g.mean(1, keepdim=True)

        return grad_out_x, grad_out_g

    @staticmethod
    def bin2Val(x, gamma):
        return x[0] * gamma[0] + x[1] * gamma[1]

binarize2Level = Binarize2Level.apply
# -----------------------------------------------------
#--------------------------------------------
# Funzione di binarizzazione multilivello
class Binarize2Level2D(torch.autograd.Function):

    # Arrotondamento per difetto dei gamma solontanto in fase di inferenze 
    # Non in fase di training, altrimenti non impara
    # AP2 soltanto durante il training di pruning ed inferenza.

    @staticmethod
    def forward(ctx, x, gamma):
        out  = torch.empty(2, x.shape[0], x.shape[1], x.shape[2], x.shape[3], device=x.device)
        r = torch.empty(2, x.shape[0], x.shape[1], x.shape[2], x.shape[3], device=x.device)

        out0 = torch.empty(x.shape, device=x.device)
        out1 = torch.empty(x.shape, device=x.device)

        out0 = torch.where(torch.ge(x, 0), 1, -1)

 
        if not torch.is_inference_mode_enabled():
            r[0] = x - out0 * gamma[0] 
        else: 
            r[0] = x - out0 * gamma[0] 

        out1 = torch.where(torch.ge(r[0], 0), 1, -1)
 
        if not torch.is_inference_mode_enabled():
            r[1] = r[0] - out1 * gamma[1]
        else:
            r[1] = r[0] - out1 * gamma[1]

        ctx.save_for_backward(gamma, r)

        out[0] = out0
        out[1] = out1
        return out

    @staticmethod
    def backward(ctx, grad_output):
        
        gamma, r = ctx.saved_tensors
        add1 = torch.where(torch.le(torch.abs(r[0]), 1), gamma[0], 0)
        add2 = torch.where(torch.le(torch.abs(r[1]), 1), gamma[1], 0)
        grad_out_x = grad_output * (add1 + add2)
        grad_out_g = grad_output * torch.where(torch.ge(r, 0), 1, 0)
        grad_out_g = grad_out_g.mean((1,3,4), keepdim=True)

        return grad_out_x, grad_out_g

    @staticmethod
    def bin2Val(x, gamma):

        if not torch.is_inference_mode_enabled():
            return x[0] * gamma[0] + x[1] * gamma[1]
        else:
            return x[0] * gamma[0] + x[1] * gamma[1] 

binarize2Level2D = Binarize2Level2D.apply
# -----------------------------------------------------

# Funzione per approssimare alla potenza di 2 più vicina
# def AP2(x):
#     return torch.sign(x) * torch.pow(2, torch.round(torch.log2(torch.abs(x))))

class AP2F(torch.autograd.Function):

    @staticmethod
    def forward(ctx, x):
        ctx.save_for_backward(x)
        return torch.sign(x) * torch.pow(2, torch.round(torch.log2(torch.abs(x))))

    @staticmethod
    def backward(ctx, grad_output):
        x, = ctx.saved_tensors
        return torch.where(torch.abs(x).le(1), grad_output, 0) # <---- era 100
        
AP2 = AP2F.apply
# ------------------------------

# -----------------------------------------------------

# Livello di Batch Normalization
# gamma e beta: parametri di traning
# inference: False fase di traning | True fase di inferenza
# E: media della popolazione
# Var: varianza della popolazione
def batchNorm(x, gamma, beta, inference = False, E = None, Var = None):
    
    eps = 1e-5
    
    if inference:

        b_num = E * gamma
        b_den = torch.sqrt(Var + eps).pow_(-1)
        b = beta - b_num * b_den
        w = gamma * torch.sqrt(Var + eps).pow_(-1) 
        y = AP2(w) * x + b            # Moltiplicazione -> shift register (mul per potenza 2)

    else:
        
        mu = torch.mean(x, dim=0)   # Media per colonna (media delle uscite di un percettrone sul mini-batch)
        var = torch.var(x, dim=0)
        z = (x - mu) / torch.sqrt(var + eps)
        y = gamma * z + beta
        
    return y
# -----------------------------------------------------

