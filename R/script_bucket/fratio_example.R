library(effectsize)
library(lsr)

# mu1 <- 40
# mu2 <- 41
# mu3 <- 42
mu1 <- 40
mu2 <- 48
mu3 <- 56
sig.eps <- 5
n <- 3 # replicates per treatment

s1 <- rnorm(n, mean = mu1, sd = sig.eps)
s2 <- rnorm(n, mean = mu2, sd = sig.eps)
s3 <- rnorm(n, mean = mu3, sd = sig.eps)

y         <- c(s1,s2,s3)
N         <- length(y)
k         <- 3
lbl.treat <- gl(k,n)

# Quick look at the treatment means we will test
mu.treat <- tapply(y, lbl.treat, mean)
mu.treat

# Box plots to visually compare treatments:
boxplot(y ~ as.factor(lbl.treat), range=0, xlab="treatment", ylab="observation", main=paste0("Expt., N=",N, ", k=",3) )
points(mu.treat,col="red",pch=16)
abline(a = mean(y), b = 0, col="darkgreen", lwd=2, lty="dashed")

# Histograms
# p1 <- hist(s1, bre=10)
# p2 <- hist(s2, bre=10)
# p3 <- hist(s3, bre=10)
# xl <- c(30,55)
# yl <- c(0,6)
# plot(p1, col=rgb(0,0,1,1/4), xlim=xl, ylim=yl, main="", xlab="")
# points(x = c(mu1),y=c(0), col=rgb(0,0,1,1), pch=16)
# plot(p2, col=rgb(1,0,0,1/4), add = T)
# points(x = c(mu2),y=c(0), col=rgb(1,0,0,1), pch=16)
# plot(p3, col=rgb(0,1,0,1/4), add = T)
# points(x = c(mu3),y=c(0), col=rgb(0,1,0,1), pch=16)


# R can handle all the ANOVA calculations automatically:
fit <- aov(y ~ as.factor(lbl.treat))
summary(fit)

fit2 <- aov(y ~ lbl.treat)
summary(fit2)


fr.samp <- summary(fit)[[1]][1,4] # Sample F-ratio
fr.samp

fr.x    <- seq(from=0, to=qf(0.97, df1 = k-1, df2 = N-k), length.out=1000)
fr.y    <- df(fr.x, df1 = k-1, df2 = N-k)
k-1 # df1
N-k # df2

plot(fr.x, fr.y, typ="l", xlab="f", ylab=paste0("F(f, k-1=",k-1," N-k=",N-k,")"), main=paste0("F dist. for N=",N, ", k=",3))
points(x = fr.samp,y=c(0), pch=16)
points(x = qf(0.95, df1 = k-1, df2 = N-k),y=c(0), pch=16, col="green")

qf(0.95, df1 = k-1, df2 = N-k)


SSA <- summary(fit)[[1]][1,2]
SSE <- summary(fit)[[1]][2,2]
MSE <- summary(fit)[[1]][2,3]
SSY <- SSA + SSE

# fraction of variation explained by treatment differences, eta^2
SSA/SSY

# fraction of variance explained by treatment differences, omega^2
(SSA - (k-1)*MSE)/(SSY + MSE)

#library(effectsize)
eta_squared(fit, ci = .95)
omega_squared(fit, ci = .95)

#library(lsr)
etaSquared(fit)

