# Length measurements (in):
x <- c(18.449, 18.468, 18.431, 18.390, 18.450, 
       18.426, 18.401, 18.438, 18.431, 18.417)

# Assume X is normally distributed and use say median and mad for the mean and sd model prameters
boot.samp.mean <- sapply(1:B, function(xx){mean(rnorm(n = n, mean = median(x), sd = mad(x)))})
hist(boot.samp.mean)

boot.samp.med <- sapply(1:B, function(xx){median(rnorm(n = n, mean = median(x), sd = mad(x)))})
hist(boot.samp.med)

boot.samp.sd <- sapply(1:B, function(xx){sd(rnorm(n = n, mean = median(x), sd = mad(x)))})
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
