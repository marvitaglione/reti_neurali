import torch
import util

class Cifar10Network(torch.nn.Module):

    def __init__(self, kernel_size=3, output_size=10, device="cpu"):

        super(Cifar10Network, self).__init__()
        self.device = device
        self.output_size = output_size

        self.l1 = torch.nn.Conv2d(3, 64, kernel_size, bias=False, device=device)
        self.b1 = torch.nn.BatchNorm2d(64, device=device)
        self.r1 = torch.nn.ReLU()

        self.l2 = torch.nn.Conv2d(64, 64, kernel_size, bias=False, device=device)
        self.b2 = torch.nn.BatchNorm2d(64, device=device)
        self.r2 = torch.nn.ReLU()
        self.m2 = torch.nn.MaxPool2d(2,2)

        self.l3 = torch.nn.Conv2d(64, 128, kernel_size, bias=False, device=device)
        self.b3 = torch.nn.BatchNorm2d(128, device=device)
        self.r3 = torch.nn.ReLU()

        self.l4 = torch.nn.Conv2d(128, 128, kernel_size, bias=False, device=device)
        self.b4 = torch.nn.BatchNorm2d(128, device=device)
        self.r4 = torch.nn.ReLU()
        self.m4 = torch.nn.MaxPool2d(2,2)

        self.l5 = torch.nn.Conv2d(128, 256, kernel_size, bias=False, device=device)
        self.b5 = torch.nn.BatchNorm2d(256, device=device)
        self.r5 = torch.nn.ReLU()

        self.l6 = torch.nn.Conv2d(256, 256, kernel_size, bias=False, device=device)
        self.b6 = torch.nn.BatchNorm2d(256, device=device)
        self.r6 = torch.nn.ReLU()

        self.f7 = torch.nn.Flatten()
        self.l7 = torch.nn.Linear(256, 512, bias=False, device=device)
        self.b7 = torch.nn.BatchNorm1d(512, device=device)

        self.l8 = torch.nn.Linear(512, 512, bias=False, device=device)
        self.b8 = torch.nn.BatchNorm1d(512, device=device)

        self.l9 = torch.nn.Linear(512, 10, bias=False, device=device)
        self.b9 = torch.nn.BatchNorm1d(10, device=device)
        
        self.softMax = torch.nn.Softmax(dim=0)
        self.relu = torch.nn.Sigmoid()


    def forward(self, x):

        out = self.l1(x)
        out = self.b1(out)
        out = self.r1(out)

        out = self.l2(out) 
        out = self.b2(out) 
        out = self.r2(out)
        out = self.m2(out) 

        out = self.l3(out)
        out = self.b3(out) 
        out = self.r3(out)
        
        out = self.l4(out) 
        out = self.b4(out) 
        out = self.r4(out)
        out = self.m4(out) 

        out = self.l5(out) 
        out = self.b5(out)
        out = self.r5(out) 

        out = self.l6(out) 
        out = self.b6(out) 
        out = self.r6(out)

        out = self.f7(out)
        out = self.l7(out)
        out = self.b7(out)

        out = self.l8(out)
        out = self.b8(out) 

        out = self.l9(out) 
        out = self.b9(out) 

        return out

    def trainModel(self, training_loader, test_loader, epochs=100, lr=0.01, writer = None, PATH = None):

        loss_function = torch.nn.CrossEntropyLoss()
        optimizer = torch.optim.SGD(self.parameters(), lr=lr, momentum=0.9, weight_decay=5e-4)
        scheduler = torch.optim.lr_scheduler.CosineAnnealingLR(optimizer, 200)

        maxAcc = 0

        for epoch in range(epochs):

            loss = None

            for i, (images, labels) in enumerate(training_loader):

                # Forward phase
                images = images.to(self.device)
                labels = labels.to(self.device)
                predictions = self(images)

                labels_pred = torch.zeros(len(labels), self.output_size, device=self.device)
                for j in range(len(labels)):
                    labels_pred[j][labels[j]] = 1

                loss = loss_function(predictions, labels_pred)

                # Backpropagation
                optimizer.zero_grad()
                loss.backward()
                optimizer.step()
                
                if i % 100 == 0:
                    print(f"epoch = {epoch+1}/{epochs}, step = {i}/{len(training_loader)}, loss = {loss}")

            # Evaluate accuracy on test dat 
            accVal = self.getAccuracy(self, test_loader, device=self.device)
            print(f"accVal = {accVal}%")

            if PATH is not None and accVal > maxAcc:
                maxAcc = accVal
                util.save_model(self, PATH)
            
            scheduler.step()

            # Write result on tensorboard
            if writer is not None:
                writer.add_scalar("Training loss", loss, epoch)
                writer.add_scalar("Validation accuracy", accVal, epoch)  

    def getAccuracy(self, test_loader):

        with torch.inference_mode():

            acc = 0 
            tot = 0 # number of image processed 

            for images, labels in test_loader:
                
                images = images.to(self.device)
                labels = labels.to(self.device)

                output = self(images)
                _, predictions = torch.max(output, 1)

                acc += (predictions == labels).sum().item()
                tot += len(images)

            acc = 100 * acc / tot         
            return acc