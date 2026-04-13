library(extraDistr)

x <- c(266, 273, 273, 274, 275, 276, 276, 276, 277, 277,
       278, 278, 278, 279, 279, 280, 281, 282, 282, 284)

x.md <- median(x)
x.s  <- mad(x)
n    <- length(x)

B         <- 2000
G.bs.samp <- array(NA, c(B))
for(i in 1:B) {
  # Get a parametric BS Null data sample:
  x.bs <- rlst(n = n, df=n-1, mu = x.md, sigma = x.s)

  # Compute Grubbs statistic on the BS data sample and store
  mu.hat.bs    <- mean(x.bs)
  sdx.hat.bs   <- sd(x.bs)
  G.bs         <- max(abs(x.bs - mu.hat.bs)) / sdx.hat.bs
  G.bs.samp[i] <- G.bs
}
hist(G.bs.samp)

#Sample G-value:
G.samp <- max(abs(x-mean(x)))/sd(x)
points(c(G.samp), c(0), col="red", pch=16)

# "Critical" BS G-value for confidence level:
Gc.bs.CI <- quantile(G.bs.samp, prob=c(0.95))
points(c(Gc.bs.CI), c(0))

# Bootstrap p-value:
sum(G.bs.samp >= G.samp)/B
(1 + sum(G.bs.samp >= G.samp) )/(B+1) # Unbiased form
