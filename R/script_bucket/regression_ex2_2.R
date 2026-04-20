library(EnvStats)

x <- c(
  0.05, 0.05, 0.05, 0.10, 0.10, 0.10, 0.15, 0.15, 0.15, 0.20, 0.20, 0.20, 0.25, 0.25, 0.25, 
  0.30, 0.30, 0.30, 0.35, 0.35, 0.35, 0.40, 0.40, 0.40, 0.45, 0.45, 0.45, 0.50, 0.50, 0.50)

y <- c(
  0.014, 0.012, 0.013, 0.030, 0.030, 0.035, 0.045, 0.041, 0.046, 0.063, 0.065, 0.059, 0.078, 0.075, 0.080, 
  0.092, 0.092, 0.089, 0.107, 0.106, 0.108, 0.122, 0.121, 0.119, 0.132, 0.132, 0.137, 0.155, 0.148, 0.147)

# Preliminary scatter plot: Look at the data
plot(x,y)


# a.-h.:
fit <- lm(y ~ x)
plot(x, y, xlab="concentration", ylab="absorbance")
abline(fit)        # Show best fit line
summary(fit)       # Shows regression coefs and some diagnostics
anova(fit)         # Regression ANOVA table. "Total" row is absent

# j. Residuals analysis:
eps      <- residuals(fit)
preds <- predict(fit)      # Predicted mean y's
plot(preds, eps, main="Hetroscedastic?")

qqnorm(eps, main="Residuals Normal?")
qqline(eps)

# k. Lack of fit analysis:
anovaPE(fit)               # Use the lack of fit function in EnvStats
fit.f <- lm(y ~ factor(x)) # Alternative to using EnvStats anovaPE()
anova(fit, fit.f)

# l. Put CIs on the regression:
conf <- 0.99
plot(x, y, xlab="concentration", ylab="absorbance")
new.x  <- seq(from=min(x), to=max(x), length.out=length(x))
cis    <- predict(fit, newdata = data.frame(x=new.x), interval = "confidence", level = conf)
lines(new.x, cis[,1], lty=1, col="black") # Regression line
lines(new.x, cis[,2], lty=2, col="blue")  # Lower CI
lines(new.x, cis[,3], lty=2, col="blue")  # Upper CI

# m. Can also put prediction intervals on the regression:
pis    <- predict(fit, newdata = data.frame(x=new.x), interval = "prediction", level = conf)
lines(new.x, pis[,2], lty=2, col="red")  # Lower CI
lines(new.x, pis[,3], lty=2, col="red")  # Upper CI


# n. Predict x from a measured y (y.unk):
fit.cal <- calibrate(y ~ x, data=data.frame(x,y), max.order=1)
summary(fit.cal)

y.unk <- 0.102
inversePredictCalibrate(fit.cal, obs.y = y.unk, intervals = TRUE, coverage = 0.99, individual = TRUE) 
