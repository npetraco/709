library(dafs)

data("bottle.df")
Ba <- bottle.df$Ba
Mn <- bottle.df$Mn
plot(Ba, Mn)

# Fit and assess overall fit:
fit <- lm(Mn ~ Ba) # Basic linear regression
abline(fit)        # Show best fit line
summary(fit)       # Shows regression coefs and some diagnostics
anova(fit)         # Regression ANOVA table. "Total" row is absent

# Residuals based diagnostic checks:
preds <- predict(fit)
eps   <- residuals(fit)
plot(preds, eps, main="eps vs. pred: checks sigma^2")

hist(eps)
qqnorm(eps)
qqline(eps)


# Box-Cox transform may reduce heteroscedasticity
library(MASS)
boxcox(fit)

Ba.bc <- box.cox.transform(Ba, lambda = 0)
Mn.bc <- box.cox.transform(Mn, lambda = 0)
plot(Ba.bc, Mn.bc)

fit.bc <- lm(Mn.bc ~ Ba.bc) # Basic linear regression
abline(fit.bc)        # Show best fit line
summary(fit.bc)       # Shows regression coefs and some diagnostics
anova(fit.bc)         # Regression ANOVA table. "Total" row is absent

# Residuals based diagnostic checks:
preds.bc <- predict(fit.bc)
eps.bc   <- residuals(fit.bc)
plot(preds.bc, eps.bc, main="eps vs. pred: checks sigma^2")

hist(eps.bc)
qqnorm(eps.bc)
qqline(eps.bc)

summary(fit)
summary(fit.bc)
