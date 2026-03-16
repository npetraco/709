# The data:
x <- c(49.9996,49.9994,49.9993,49.9996,49.9995,49.9995,49.9995,49.9994,49.9995,49.9994) 
n <- length(x) # Sample size

# Approximate sampling distribution of the mean via the bootstrap:
B <- 2000
boot.samp <- sapply(1:B, function(xx){mean(sample(x, size = n, replace = T))})
hist(boot.samp)

# a. Boostrap estimate of the mean:
mean(boot.samp)

# b. Bootstrap estimate of the standard error of the mean
sd(boot.samp)

# c. Two-sided 99% CI for the mean mass via the bootstrap:
conf <- 0.99
a    <- 1 - conf
quantile(boot.samp, probs=c(a/2, 1-a/2))

# One-sided lower bound 99% CI for the mean mass via the bootstrap. 
conf <- 0.99
a    <- 1 - conf
quantile(boot.samp, probs=c(a))

# One-sided lower bound 99% CI for the mean mass via the bootstrap. 
conf <- 0.99
a    <- 1 - conf
quantile(boot.samp, probs=c(1 - a))
