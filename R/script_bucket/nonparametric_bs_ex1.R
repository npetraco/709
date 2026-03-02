# Length measurements (in):
x <- c(18.449, 18.468, 18.431, 18.390, 18.450, 
       18.426, 18.401, 18.438, 18.431, 18.417)

n <- length(x)
B <- 2000 # Do this many bootstrap iterations

boot.samp.mean <- sapply(1:B, function(xx){mean(sample(x, size = n, replace = T))})
hist(boot.samp.mean)

boot.samp.med <- sapply(1:B, function(xx){median(sample(x, size = n, replace = T))})
hist(boot.samp.med)

boot.samp.sd <- sapply(1:B, function(xx){sd(sample(x, size = n, replace = T))})
hist(boot.samp.sd)

# Bootstrap estimate and se for the mean
mean(boot.samp.mean)
sd(boot.samp.mean)

# Bootstrap estimate and se for the median
mean(boot.samp.med)
sd(boot.samp.med)

# Bootstrap estimate and se for the standard deviation
mean(boot.samp.sd)
sd(boot.samp.sd)
