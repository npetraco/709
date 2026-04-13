library(frequtils)

all.dat <- do.call(rbind, dropout.info)
lhp     <- all.dat[all.dat[,3] == 0, 2] # Peak Present
lhd     <- all.dat[all.dat[,3] == 1, 2] # Peak Dropout

boxplot(lhp,lhd, ylab="log(H)", names=c("peak","dropout"))

# a. Two sample two-sided bootstrapped hypothesis test:
bs.test(lhp, lhd, paired=F, conf.level = 0.95, alternative = "two.sided")

# Compare to (parametric) t-test result
t.test(lhp, lhd, conf.level = 0.95, paired = F, var.equal = F, alternative = "two.sided")


# b. Two sample one-sided bootstrapped hypothesis test:
bs.test(lhp, lhd, paired=F, conf.level = 0.95, alternative = "greater")

# Compare to (parametric) t-test result
t.test(lhp, lhd, conf.level = 0.95, paired = F, var.equal = F, alternative = "greater")

