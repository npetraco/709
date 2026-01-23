mu    <- 67
sigma <- 18.3

# A sample of data with mean mu and sd sigma:
X <- rnorm(1000, mean = mu, sd = sigma)
hist(X, probability = T)
xx <- seq(from=min(X), to=max(X), length.out=1000)
lines(xx, dnorm(xx,mean = mu,sd = sigma), lwd=3)

# Standardize the sample:
Z <- (X - mean(X))/sd(X)
hist(Z, probability = T)
zz <- seq(from=min(Z), to=max(Z), length.out=1000)
lines(zz, dnorm(zz, mean = 0, sd = 1), lwd=3, col="blue")
mean(Z)
sd(Z)
