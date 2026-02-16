# Data: Errors
errs <- c(0,0,20,0,1)

# Pool data. Assume one big test of 250 questions:
n <- 50*5

# Error rate estimate:
pi.hat <- sum(errs)/n
pi.hat

# SE of error rate:
pi.se <- sqrt((pi.hat * (1 - pi.hat)) / n)
pi.se

# Plot:
x <- seq(from=0, to=40)
y <- dbinom(x, size = n, prob = pi.hat)
plot(x,y, typ="h", xlab="x (errors)", ylab="p(x)", main="Binomial PMF for # errors")
