import torch
from torch.nn.utils import prune

def getAccuracy(model, test_loader, device="cpu", dim=1):

    with torch.inference_mode():

        acc = 0 
        tot = 0 # number of image processed 

        for images, labels in test_loader:

            if dim == 1:
                images = images.reshape(len(images), -1)
            
            images = images.to(device)
            labels = labels.to(device)

            output = model(images)
            _, predictions = torch.max(output, 1)

            acc += (predictions == labels).sum().item()
            tot += len(images)

        acc = 100 * acc / tot         
        return acc

# EVITARE DI USARE. MEGLIO UTILIZZARE I TRAIN OFFERTI DALLE CLASSI.
def train(model, training_loader, test_loader, loss_function, optimizer, epochs=100, lr=0.01, dim=1, output_size=None, device="cpu", writer = None, PATH = None, froze=False):

    maxAcc = 0

    for epoch in range(epochs):

        loss = None

        for i, (images, labels) in enumerate(training_loader):
            
            # Se dim = 1, DNN (l'input deve essere linearizzato)
            # Se dim = 2, CNN
            if dim == 1:
                images = images.reshape(len(images), -1)

            images = images.to(device)
            labels = labels.to(device)

            # Forward 
            if froze:
                model.setInference(False)
            predictions = model(images)

            if str(loss_function) == "MSELoss()":
                labels_expand = torch.zeros(len(labels), output_size, device=device)
                for j in range(len(labels)):
                    labels_expand[j][labels[j]] = 1
                labels = labels_expand

            loss = loss_function(predictions, labels)

            # Backpropagation
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            
            if i % 100 == 0:
                print(f"epoch = {epoch+1}/{epochs}, step = {i}/{len(training_loader)}, loss = {loss}")

        else:
            if froze:
                model.frozeParameter(len(images))
                model.setInference(True)

        # Evaluate accuracy on test dat 
        accVal = getAccuracy(model, test_loader, device=device)
        print(f"accVal = {accVal}%")

        if PATH is not None and accVal > maxAcc:
            maxAcc = accVal
            save_model(model, PATH)

        # Write result on tensorboard
        if writer is not None:
            writer.add_scalar("Training loss", loss, epoch)
            writer.add_scalar("Validation accuracy", accVal, epoch) 

        # Update learning rate
        for g in optimizer.param_groups:
            g['lr'] = lr * 0.95


def load_model(model, path, device=torch.device("cpu")):
    model.load_state_dict(torch.load(path, map_location=device))
    model.eval()

def save_model(model, path):
    torch.save(model.state_dict(), path)


#------------------------ PRUNING
class ThresholdPruning(prune.BasePruningMethod):
    PRUNING_TYPE = "unstructured"

    def __init__(self, threshold):
        self.threshold = threshold

    def compute_mask(self, tensor, default_mask):
        return torch.abs(tensor) > self.threshold

# Converte un numero da esadecimale in binario su nom_of_bits bit
def hex2bin(x, num_of_bits):

    output = ""
    for elem in x:
        match elem:
            case "0":
                output += '0000'
            case "1":
                output += '0001'
            case "2":
                output += '0010'
            case "3":
                output += '0011'
            case "4":
                output += '0100'
            case "5":
                output += '0101'
            case "6":
                output += '0110'
            case "7":
                output += '0111'
            case "8":
                output += '1000'
            case "9":
                output += '1001'
            case "A":
                output += '1010'
            case "B":
                output += '1011'
            case "C":
                output += '1100'
            case "D":
                output += '1101'
            case "E":
                output += '1110'
            case "F":
                output += '1111'
    return output[len(output) - num_of_bits : len(output)]

# Converte dalla codifica in complementi a 2 ad intero con segno
def bin2int(x):
    tot = 0
    tot -= 2**(len(x) - 1) * int(x[0])
    for i in range(len(x)):
        if i == 0:
            continue
        tot += 2**(len(x) - i - 1) * int(x[i])
    return tot

#---------- ---------------
import os
def report(text):
    pass
    # with open(f"{os.path.dirname(__file__)}/log.txt", 'a+') as f:
    #    f.write(text)
