library(sn)

xx <- seq(from=0, to=100, length.out=5000)
#yy <- dnorm(xx, mean = 45, sd = 15)
yy <- dsn(xx, xi = 45, omega = 15, alpha = -1.5)
plot(xx,yy, xlab="score-x", ylab="dsn(x)", main="A Test Scores Randomness Model:")

samp <- rsn(1000, xi = 45, omega = 15, alpha = -1.5)
samp <- samp[-which(samp<0)]

plot(samp, typ="l", xlab="sample#", ylab="modeled-scores", main="Simulation of x")

hist(samp, probability = F, xlab="score-sample", main="Sample of x", xlim=c(0,100))

hist(samp, probability = T, xlab="score-sample", main="Sample of x", xlim=c(0,100))
lines(xx,yy, lwd=3)
