set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col="blue", pch = 19, cex = 2)
text(x + 0.05, y+ 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
# Cluster Dendrogram
plot(hClustering)

set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)

kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)

kmeansObj$cluster
kmeansObj$centers

par(mar= rep(0.2, 4))
plot(x, y, col= kmeansObj$cluster, pch = 19, cex =2)
points(kmeansObj$centers, col = 1:3, pch = 3, lwd = 3)


set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample((1:12),)]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj2$cluster)], yaxt = "n")


set.seed(1234)
par(mar=rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

par(mar = rep(0.2, 4))
heatmap(dataMatrix)


set.seed(678910)
for(i in 1:40){
  #flip a coin
  coinFlip <- rbinom(1, size = 1, prob = 0.5 )
  # if coin is heads add a common pattern to that row
  if(coinFlip){
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
  }
  
}


par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

par(mar = rep(0.2, 4))
heatmap(dataMatrix)

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c(1,3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab="Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab="Column", ylab = "Column mean", pch= 19)

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1,3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[, 1], 40:1, , xlab = "Row", ylab = "First left singular vector", pch = 19)
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)



par(mfrow = c(1,2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained", pch = 19)

svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)

plot(pca1$rotation[, 1], svd1$v[, 1], pch = 19, xlab = "Principal Component 1", ylab = "Right Singular Vector 1")
abline(c(0,1))


pal <- colorRamp((c("red", "blue")))
pal(0)
pal(seq(0, 1, len = 10))

pal <- colorRampPalette((c("red", "yellow")))
pal(2)
pal(10)

library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

x <- rnorm(1000)
y <- rnorm(1000)
smoothScatter(x, y)

plot(x, y, col = rgb(0, 0, 0, 0.2), pch = 19)

library(swirl)
swirl()
