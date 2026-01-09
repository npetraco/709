m         <- 0
b         <- 0
sigma.eps <- 3.56
n         <- 20
eps       <- rnorm(n, mean = 0, sd = sigma.eps)

x <- seq(from=0, to=40, length.out=n)
y <- m*x + b + eps
plot(x,y, xlim=c(0,40), ylim=c(0,max(y)))
plot(x,y, xlim=c(0,40))
fit <- lm(y~x)
abline(fit)
summary(fit)
