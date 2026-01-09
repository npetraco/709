library(dafs)

data(bottle.df)
attach(bottle.df)

# Take a look at your data first:
x <- Ba
y <- Mn
n <- length(x)

plot(x,y)

SSY  <- sum((y-mean(y))^2)
SSX  <- sum((x-mean(x))^2)
SSXY <- sum((x-mean(x)) * (y-mean(y)))

SSR <- SSXY^2/SSX
SSE <- SSY - SSR
MSR <- SSR/1
MSE <- SSE/(n-2)
MSY <- SSY/(n-1)

# Simple linear regression:
fit <- lm(Mn ~ Ba)
summary(fit)

(SSY-SSE)/SSY # Multiple R^2
SSR/SSY       # Multiple R^2
sqrt(MSE)     # Residual standard error
MSR/MSE       # F-ratio
(MSY-MSE)/MSY # Adjusted R^2

# Check SSE by alternative method:
a <- fit$coefficients[1]
b <- fit$coefficients[2]
SSE2 <- sum((y - a - b*x)^2)
(SSY-SSE2)/SSY    # Multiple R^2
sqrt(SSE2/(n-2))  # Residual standard error

# ANOVA table for the regression
# Note: "Total" row is absent
anova(fit)


MSR/MSE
SSR; MSR
SSE; MSE

MSR + MSE
MSY

# Plot in your regression line:
plot(x,y)
abline(fit)

detach(bottle.df)
