library(RColorBrewer)
library(rattle)
library(rpart)
library(rpart.plot)
cancer.uci<- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer/breast-cancer.data"),
                      header=FALSE)

colnames(cancer.uci) <- c("class","age","menopause","tumor","inv-nodes",
                          "node-caps","deg-malig","breast","breast-quad","irradiat")

s <- sample(200,100)
dim(cancer.uci)
cTrain <- cancer.uci[s,]
cTest <- cancer.uci[-s,]
cTree <- rpart(irradiat~class+age+menopause+tumor+breast,cancer.uci,method="class")

rpart.plot(cTree, main="Classification of Breast Cancer Data", type=1, compress=TRUE)
prunedTree <- prune(cTree, cp=0.01)
fancyRpartPlot(prunedTree, main="Classification of UCI Database Breast Cancer Data")
