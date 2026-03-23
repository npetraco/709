# Two-sided test
# H0:mu=50 vs. Ha:mu!=50
x    <- c(49.9996, 49.9994, 49.9993, 49.9996, 49.9995, 49.9995,49.9995, 49.9994, 49.9995, 49.9994)
mu   <- 50   # mu for H0
conf <- 0.95 # chosen confidence level

# Ingredients we need for the t-test:
xbar <- mean(x)
sdx  <- sd(x)
n    <- length(x)
se   <- sdx/sqrt(n)
alp  <- 1-conf

t.samp <- (xbar - mu)/se        # sample's t-statistic
tc2    <- qt(1-alp/2, df = n-1) # critical t-statistic for H0:mu=50 vs. Ha:mu!=50

t.samp
tc2
t.samp >= -tc2 & t.samp <= tc2 # Is t.samp in the confidence interval for H0?

# Visualizes where t-statistics fall and compute p-value:
tt  <- seq(-20,20,length.out=1000)
yt <- dt(tt, df = n-1)

plot(tt, yt, typ="l")                        # Null (H0) distribution
points(x = tc2, y = 0, pch=16, col="green")  # Max where we expect sample to fall for if mu=50
points(x = -tc2, y = 0, pch=16, col="green") # Min where we expect sample to fall for if mu=50
points(x = t.samp, y = 0, pch=16, col="red") # Where sample actually falls
2*pt(q = t.samp, df = n-1)                   # (two-sided) p-value (i.e. for H0:mu=50 vs. Ha:mu!=50)

# CHECK in original data units:
# Two-Sided CI for the mean:
muhat.lo <- xbar - tc2*se
muhat.hi <- xbar + tc2*se
c(muhat.lo, muhat.hi) # Does this capture mu?

# Visualization for two-sided test in original data units:
xx <- mu+se*tt
plot(xx, yt, typ="l")                                 # Null (H0: mu = 50) distribution
points(x = mu - tc2*se, y = 0, pch=16, col="green")   # visualization for H0: mu = 50
points(x = mu + tc2*se, y = 0, pch=16, col="green")
points(x = mu,          y = 0, pch=16, col="darkgreen")

points(x = muhat.hi, y = 0, pch=16, col="red")        # Where the data ACTUALLY falls wrt H0  
points(x = muhat.lo, y = 0, pch=16, col="red")
points(x = xbar,     y = 0, pch=4, col="darkred", lwd=2)

# Well actually, you can do all this in one line:
t.test(x, alternative = "two.sided", mu = 50.0000, conf.level = 0.95)
