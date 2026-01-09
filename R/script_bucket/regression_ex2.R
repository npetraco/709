library(EnvStats)

# Concentrations:
x     <- c(0.025, 0.025, 0.025, 0.05, 0.05, 0.05, 0.1, 0.1, 0.1, 0.2, 0.2, 0.2)
x.avg <- c(0.025, 0.05, 0.1, 0.2)

# Absorbances:
y     <- c(0.005, 0.005, 0.005, 0.011, 0.012, 0.012, 0.025, 0.027, 0.026, 0.051, 0.052, 0.051)
y.avg <- c(0.005, 0.01166667, 0.026, 0.05133333)

# Absorbances of "unknowns":
y.unk <- c(0.594, 0.594, 0.592, 0.59, 0.561, 0.559)
y.unk.avg <- mean(y.unk)

plot(x.avg, y.avg, xlab="concentration", ylab="absorbance")
plot(x, y, xlab="concentration", ylab="absorbance")

# Fit with replicate responses:
fit1 <- lm(y ~ x)   # Basic linear regression
plot(x, y, xlab="concentration", ylab="absorbance")
abline(fit1)        # Show best fit line
summary(fit1)       # Shows regression coefs and some diagnostics
anova(fit1)         # Regression ANOVA table. "Total" row is absent

# Residuals analysis:
eps1   <- residuals(fit1)
preds1 <- predict(fit1)
plot(preds1, eps1, main="Hetroscedastic?")

qqnorm(eps1, main="Normal?")
qqline(eps1)

# Lack of fit analysis:
anovaPE(fit1)               # Use the lack of fit function in EnvStats
fit1.f <- lm(y ~ factor(x)) # Alternative to using EnvStats anovaPE()
anova(fit1, fit1.f)

# Put CIs on the regression:
plot(x, y, xlab="concentration", ylab="absorbance")
new.x  <- seq(from=min(x), to=max(x), length.out=length(x))
cis    <- predict(fit1, newdata = data.frame(x=new.x), interval = "confidence", level = 0.99)
lines(new.x, cis[,1], lty=1, col="black") # Regression line
lines(new.x, cis[,2], lty=2, col="blue")  # Lower CI
lines(new.x, cis[,3], lty=2, col="blue")  # Upper CI

# Prediction of x values from y values:
b0 <- fit1$coefficients[1] # intercept
b1 <- fit1$coefficients[2] # slope
# y = b1 x + b0 so:
# x = (y - b0)/b1
(y.unk - b0)/b1


# Using EnvStats library instead:
calibrate.list <- calibrate(y ~ x, data=data.frame(x,y), max.order=1)
summary(calibrate.list)

pred.list <- predict(calibrate.list, newdata = data.frame(x=new.x), se.fit = TRUE)
pred.list

pointwise.list <- pointwise(pred.list, coverage = 0.99, individual = TRUE)

plot(x, y, ylim = c(min(pointwise.list$lower), max(pointwise.list$upper)), xlab = "concentration", ylab = "absorbance") 
abline(calibrate.list, lwd=2) 
lines(new.x, pointwise.list$lower, lty=8, lwd=2) 
lines(new.x, pointwise.list$upper, lty=8, lwd=2) 


# Now estimate the true concentration based on 
# an observed signal of 60 ng/L. 

inversePredictCalibrate(calibrate.list, obs.y = y.unk, 
                        intervals = TRUE, coverage = 0.99, individual = TRUE) 



library(chemCal)
m0 <- lm(y ~ x)
calplot(m0, legend_x = c(0,0))
inverse.predict(m0, y.unk[1])

library(investr)
# XXXXXXXXX


