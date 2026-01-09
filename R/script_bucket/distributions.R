# Normal distribution example
x <- seq(-4,4,length.out=1000)
y <- dnorm(x, mean = 0, sd=1)
plot(x,y, typ="l", ylab="p(x)")

# Student-t distribution
x <- seq(-4,4,length.out=1000)
y <- dt(x, df = 5)
plot(x,y, typ="l", ylab="p(x)")

# Log Normal distribution example
x <- seq(0,4,length.out=1000)
y <- dlnorm(x, mean = 0, sd=1)
plot(x,y, typ="l", ylab="p(x)")


# Cauchy distribution examle
x <- seq(-4,4,length.out=1000)
y <- dcauchy(x, location = 0, scale = 1)
plot(x,y, typ="l", ylab="p(x)")


# Gamma distribution example
x <- seq(0,4,length.out=1000)
y <- dgamma(x, shape = 3, rate = 4)
plot(x,y, typ="l", ylab="p(x)")


# Chi-square distribution example
x <- seq(0,20,length.out=1000)
y <- dchisq(x, df = 5)
plot(x,y, typ="l", ylab="p(x)")


# Exponential distribution example
x <- seq(0,4,length.out=1000)
y <- dexp(x, rate = 3)
plot(x,y, typ="l", ylab="p(x)")

# Uniform distribution example
x <- seq(-4,4,length.out=1000)
y <- dunif(x, min = -4, max = 4)
plot(x,y, typ="l", ylab="p(x)")


# Weibull distribution example
x <- seq(0,15,length.out=1000)
y <- dweibull(x, shape = 2, scale = 3) # R/Stan parameterization for Weibull
plot(x,y, typ="l", ylab="p(x)")
alp <- 2
sig <- 3
lam <- sig^(-alp)
f   <- function(y,v,l){v*l*y^(v-1) * exp(-l*y^v)} # JAGS parameterization for Weibull
plot(x,f(x, v=alp, l=lam), typ="l", ylab="p(x)")


# Beta distribution example
x <- seq(0,1,length.out=1000)
y <- dbeta(x, shape1 = 5, shape2 = 2)
plot(x,y, typ="l", ylab="p(x)")

# Bernoulli distribution example
x <- seq(0,1)
y <- dbinom(x, size = 1, prob = 0.4)
plot(x,y, typ="h", ylab="p(x)", ylim=c(0,1), xaxt="n", lwd=4)
axis(1, at = c(0,1), labels = c("fail", "success"))


# Binomial distribution example
x <- seq(0,10)
y <- dbinom(x, size = 10, prob = 0.4)
plot(x,y, typ="h", ylab="p(x)")


# Poisson distribution example
x <- seq(0,18)
y <- dpois(x, lambda = 6)
plot(x,y, typ="h", ylab="p(x)")


# Hypergeometric distribution example
x <- seq(15,26)
y <- dhyper(x, m = 90, n = 10, k = 23)
plot(x,y, typ="h", ylab="p(x)")
