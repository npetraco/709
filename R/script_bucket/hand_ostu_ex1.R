# One-sided test upper
# H0:mu<=50 vs. Ha:mu>50

x    <- c(49.9996, 49.9994, 49.9993, 49.9996, 49.9995, 49.9995,49.9995, 49.9994, 49.9995, 49.9994)
mu   <- 50   # mu for H0
conf <- 0.95 # chosen confidence level

# Stuff we need for the t-test:
xbar <- mean(x)
sdx  <- sd(x)
n    <- length(x)
se   <- sdx/sqrt(n)
alp  <- 1-conf

t.samp <- (xbar - mu)/se      # sample's t-statistic
tc1u   <- qt(1-alp, df = n-1) # critical t-statistic for H0:mu<=50 vs. Ha:mu>50

# Visualizes where t-statistics fall and compute p-value:
tt <- seq(-20,20,length.out=1000)
yt <- dt(tt, df = n-1)

plot(tt, yt, typ="l")                        # Null (H0) distribution
points(x = tc1u, y = 0, pch=16, col="green") # Max where we'd expect sample to fall IF (H0) mu<=50
points(x = t.samp, y = 0, pch=16, col="red") # Where sample ACTUALLY falls
1-pt(q = t.samp, df = n-1)                   # one-sided p-value for H0:mu<=50 vs. Ha:mu>50)


# Well actually, you can do all this in one line:
t.test(x, alternative = "greater", mu = 50.0000, conf.level = 0.95)
