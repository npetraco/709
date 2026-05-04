library(effectsize)

# Data (responses)
y <- c(
  2.60,3.35,3.33,3.06,3.38,3.85,3.01,3.02,3.29,3.00,3.20,3.11,
  6.84,6.32,6.96,5.85,5.95,6.29,5.57,5.00,5.42,5.73,5.29,5.10,
  6.51,6.72,8.24,7.38,9.84,9.42,8.09,6.80,7.95,8.62,8.41,8.62,9.23,
  10.28,11.47,14.10,12.54,16.13,11.03,10.81,10.19,13.01,11.17,11.33,9.35,
  11.80,13.74, 5.18,20.13,16.94,14.09,16.07,14.90,17.47,14.21,13.13,11.93
)

# Treatment labels for each data point
lbl.treat <- c(
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,
  50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50
)

# Box plots to visually compare treatments:
boxplot(y ~ as.factor(lbl.treat), range=0 )

# Quick look at the treatment means we will test
tapply(y, lbl.treat, mean)

# R can handle all the ANOVA calculations automatically:
fit <- aov(y ~ as.factor(lbl.treat))
summary(fit)

# But the variances of each treatment do not look equal
# so let's try Welch's ANOVA which does not make this assumption:
# Test the treatment variances just to be sure:
bartlett.test(y ~ as.factor(lbl.treat))

# Welch's ANOVA (but no ANOVA table output)
fit.alt <- oneway.test(y ~ as.factor(lbl.treat), var.equal = F)
fit.alt

# Effects sizes, for equal variance model:
eta_squared(fit, ci = .95)
omega_squared(fit, ci = .95)

# Approximate effects sizes, for unequal variance model:
eta_squared(fit.alt, ci = .95)
omega_squared(fit.alt, ci = .95)

