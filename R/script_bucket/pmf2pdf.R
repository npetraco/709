# Simulate a working sample:
n    <- 100000
samp <- rnorm(n, mean = 0, sd = 1)

# PMFs of varying bin numbers:
hist(samp, breaks=10, main="10 Bins PMF")
hist(samp, breaks=20, main="20 Bins PMF")
hist(samp, breaks=40, main="40 Bins PMF")
hist(samp, breaks=80, main="80 Bins PMF")
hist(samp, breaks=160, main="160 Bins PMF")

# Overlay PDF on PMF:
z <- seq(from=-4, to=4, length.out=1000)
hist(samp, breaks=160, probability = T, main="Continuous PDF", xlab="z")
lines(z, dnorm(z), col="red", lwd=3)
