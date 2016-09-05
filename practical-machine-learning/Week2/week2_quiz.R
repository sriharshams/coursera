install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
data(AlzheimerDisease)

adData = data.frame(predictors)
trainIndex = createDataPartition(diagnosis,p=0.5,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

adData = data.frame(diagnosis,predictors)
train = createDataPartition(diagnosis, p = 0.50,list=FALSE)
test = createDataPartition(diagnosis, p = 0.50,list=FALSE)

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

install.packages("caret")
install.packages("Hmisc")
install.packages("e1071")
  
#Quiz 2
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

library(Hmisc)
cols <- colnames(training)
subCols <- cols[-length(cols)] #all but CompressiveStrength
plotCols = 2
par(mfrow = c(ceil(length(subCols)/plotCols), plotCols))
res <- sapply(subCols, function(colName){
  cut <- cut2(training[,colName])
  lab <- paste0("index: col=",colName)
  plot(training$CompressiveStrength, pch=19, col=cut, xlab=lab, ylab="CompressiveStrength")
})


#Quiz 3
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

par(mfrow = c(1,2))
hist(training$Superplasticizer, breaks = 50)
hist(log(training$Superplasticizer + 1), breaks = 50)



#Quiz 4
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

IL_Colnames = grep("^IL", colnames(training), value=TRUE,ignore.case=TRUE)
pcaMod <- preProcess(training[,IL_Colnames], method="pca", thresh=0.8)
pcaMod


#Quiz 5
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

createSet <- function(ds){
  IL_Colnames = grep("^IL", colnames(ds), value=TRUE,ignore.case=TRUE)
  ds[,IL_Colnames]
}

trainingIL <- createSet(training)
testingIL <- createSet(testing)

model_no_pca <- train(training$diagnosis ~ ., trainingIL, method="glm")
predictIL_no_pca <- predict(model_no_pca,testingIL)
result_no_pca <- confusionMatrix(testing$diagnosis, predictIL_no_pca)

result_no_pca$overall["Accuracy"]

pcaObj <- preProcess(trainingIL, method="pca", thresh=0.8)
trainingIL_pca <- predict(pcaObj, trainingIL)
testingIL_pca <- predict(pcaObj, testingIL)

model_pca <- train(training$diagnosis ~ ., trainingIL_pca, method="glm")
predictIL_pca <- predict(model_pca,testingIL_pca)
result_pca <- confusionMatrix(testing$diagnosis, predictIL_pca)

result_pca$overall["Accuracy"]
