library(frequtils)
library(mlbench)

data(Glass)
boxplot(Glass$RI ~ Glass$Type)

glass.type <- "6"
idx        <- which(Glass$Type == glass.type)
dat        <- Glass[idx, ]

x          <- dat$RI
x.std      <- (x-mean(x))/sd(x) # Standardize the data
boxplot(x.std, horizontal = T)

# Check for fit to standard normal
qqnorm(x.std, xlim=c(-3,3), ylim=c(-3,3))
qqline(x.std)

# Compute sample Tietjen-Moore test statistic:
k       <- 2 # assume two outliers
Ek.samp <- tmts(x.std, k)
Ek.samp

# Use a parametric bootstrap to get the Null (no outlier) distribution of Ek
n          <- length(x.std)
B          <- 2000
Ek.bs.samp <- array(NA, c(B))
for(i in 1:B) {
  # Get a parametric BS Null data sample:
  # No outlier data should be standard normal
  x.bs <- rnorm(n, mean = 0, sd = 1)

  # Ek statistic on the BS data sample and store
  Ek.bs <- tmts(x.bs, k)
  Ek.bs.samp[i] <- Ek.bs
}
hist(Ek.bs.samp)

# "Critical" BS Ek-value:
Ek.c.bs <- quantile(Ek.bs.samp, prob=c(0.05))
Ek.c.bs
points(c(Ek.c.bs), c(0), col="red", pch=16) # Critical Ek
points(c(Ek.samp), c(0))                    # Sample Ek

# Bootstrap p-value:
sum(Ek.bs.samp <= Ek.samp)/B
(1 + sum(Ek.bs.samp <= Ek.samp) )/(B+1) # Unbiased form
