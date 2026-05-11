library(frequtils)
library(rgl)

X   <- gas[,2:ncol(gas)]
lbl <- as.factor(gas[,1])

# Scale data if desired:
X <- scale(X,center=T,scale=T)[,]

S <- cov(X)
R <- cor(X)

es <- eigen(S)
pc.vars <- es$values/sum(es$values)
pc.vars <- round(pc.vars * 100,2)
pc.vars
cumsum(pc.vars)

#Compute PCA "scores":
Apc <- es$vectors # PCA "loadings" (weights)
Zpc <- X %*% Apc
plot(Zpc[,1], Zpc[,2], col=lbl, pch=16)
text(Zpc[,1], Zpc[,2], labels = lbl, adj = 1)

plot3d(Zpc[,1], Zpc[,2], Zpc[,3], col=lbl, xlab="PC1", ylab="PC2", zlab="PC3", aspect="iso")
text3d(Zpc[,1], Zpc[,2], Zpc[,3], texts = lbl)

# Interpretation of PCA loadings
component <- 1:ncol(Apc)
j            <- 2
rpci         <- sqrt(es$values[j]) * Apc[,j] # r correlation coefs of x_i with PC-eigenvector component
loading.info <- data.frame(component, colnames(X), Apc[,j], rpci, rpci^2)

colnames(loading.info) <- c("component_i", "X_i", paste0("Apc_i",i), "r", "r^2")
loading.info

plot(abs(Apc[,j]), type = "h", ylab=paste0("abs(A_i",j,") coefs."), xlab="x_i", main=paste0("Abs. Eigenvector-Loadings: PC#: ", j))
plot(rpci, type = "h", ylab="r corr. coef.", xlab="x_i", main=paste0("Correlation-Loadings: PC#: ", j))
plot(rpci^2, type = "h", ylab="r^2", xlab="x_i", main=paste0("Multiple r^2: PC#: ", j))

#component_i          X_i      Apc_i2           r          r^2
#3                 o.Xylene -0.38812001 -0.43518937 0.1893897844
plot(X[,3], Zpc[,2], xlab="o.Xylene (scaled)", ylab="Zpc2 score")
fit <- lm(Zpc[,2] ~ X[,3])
fit.info <- summary(fit)
sqrt(fit.info$r.squared)
cor(X[,3], Zpc[,2])
sqrt(fit.info$adj.r.squared)
abline(fit)
