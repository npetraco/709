library(frequtils)

data(gas)
x <- gas$C4.alkylbenzene.unid.5
hist(x)

# Standardize the data
z <- (x-mean(x))/sd(x)

# QQ-plot wrt/ standard normal distribution:
qqnorm(z, xlim=c(-3,3), ylim=c(-3,3))
qqline(z)

# A more general way to make a QQ-plot:
ref.samp <- rnorm(length(x), mean = 0, sd = 1)
qqplot(ref.samp, z, main="QQ-Plot", xlim=c(-3,3), ylim=c(-3,3))
qqline(z, distribution = function(p){qnorm(p, mean = 0, sd = 1)})
