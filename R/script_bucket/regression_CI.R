library(dafs)

data("bottle.df")
attach(bottle.df)

fit <- lm(Mn ~ Ba)
plot(Mn ~ Ba)
abline(fit)

new.Ba <- seq(from=min(Ba), to=max(Ba), length.out=200)
cis    <- predict(fit, newdata = data.frame(Ba=new.Ba), interval = "confidence", level = 0.95)
lines(new.Ba, cis[,2], lty=2, col="blue")
lines(new.Ba, cis[,3], lty=2, col="blue")

