m       <- 3
b       <- 10
n       <- 30
sig.eps <- 7.6
x <- seq(from=-10, to=10, length.out=n)
y <- m*x + b + rnorm(n,mean = 0, sd = sig.eps)
plot(x,y)

fit <- lm(y ~ x)
summary(fit)
eps <- residuals(fit)

SSE <- sum((y-predict(fit))^2)
SSY <- sum((y-mean(y))^2)
SSR <- SSY-SSE

SSR/SSY         # r^2 
sqrt(SSE/(n-2)) # sig.eps.hat
sd(eps)

plot(x,y)
abline(fit)
hist(eps)
qqnorm(eps)
qqline(eps)
shapiro.test(eps)

