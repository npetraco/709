library(frequtils)
library(dafs)

data(shotgun.df)
dat <- shotgun.df[1:50, ]
y   <- dat$sqrt.area
lbl <- as.factor(dat$range)
boxplot(y ~ lbl)

# Do a regular ANOVA:
fit1 <- aov(y ~ lbl)
summary(fit1)

# Optionally check residuals
eps <- residuals(fit1)
qqnorm(eps)
qqline(eps)
hist(eps)

# Do a Welch ANOVA also since the variance
# is not constanstant for this data
fit2 <- oneway.test(y ~ lbl, var.equal = F)
fit2

# Find a significant result from regular ANOVA? Do a Tukey HSD:
fit1.tukey <- TukeyHSD(fit1)
fit1.tukey       # Tukey test outputs
plot(fit1.tukey) # Graphical version

# For anything other than regular ANOVA we must use pairwise tests:
pairwise.t.test(y, lbl, pool.sd = F, p.adjust.method = "fdr")
pairwise.tests(y, lbl, confidence = 0.95, type = "t.test", p.adjust.method = "fdr", pool.sd = F)
pairwise.tests(y, lbl, confidence = 0.95, type = "t.test", p.adjust.method = "bonferroni", pool.sd = F)

