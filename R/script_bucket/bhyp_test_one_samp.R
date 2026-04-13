library(frequtils)
?dropout.info

# Preprocess by gluing all data together into a matrix
all.dat <- do.call(rbind, dropout.info)
all.dat

# Separate dropout vs not dropout data
# Data we'll use log(H) scores for peaks and dropouts
lhp     <- all.dat[all.dat[,3] == 0, 2] # Peak Present
lhd     <- all.dat[all.dat[,3] == 1, 2] # Peak Dropout

boxplot(lhp,lhd, ylab="log(H)", names=c("peak","dropout"))


# One sample bootstrapped hypothesis test:
bs.test(lhd, mu = 3, conf.level = 0.95, alternative = "greater")

# For comparison, one sample t-test:
t.test(lhd, mu = 3, conf.level = 0.95, alternative = "greater")

