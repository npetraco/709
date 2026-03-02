x <- c(117.7, 97.6, 147.4, 139.6, 135.5, 130.8, 141.0, 
       137.6, 115.0, 134.0, 122.3, 148.0, 121.6, 132.5, 119.8)

#a. MLE, unbiased and bootstrap estimates for average concentration
mean(x) # MLE and unbiased est. are the same

boot.samp.mean <- sapply(1:B, function(i){mean(sample(x, size = n, replace = T))})
mean(boot.samp.mean)

#b. MLE, unbiased and bootstrap estimates for s.d. concentration
sqrt(1/length(x) * sum((x - mean(x))^2))

sd(x)

B <- 2000
boot.samp.sd <- sapply(1:B, function(i){sd(sample(x, size = n, replace = T))})
mean(boot.samp.sd)

#c. MLE, unbiased and bootstrap estimates for s.e. of the average concentration
sqrt(1/length(x) * sum((x - mean(x))^2))/sqrt(length(x))

sd(x)/sqrt(length(x))

mean(boot.samp.sd)/sqrt(length(x))

#d. Bootstrap estimates for bias
mean(boot.samp.mean) - 150
