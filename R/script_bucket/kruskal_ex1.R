library(dafs)
data(abaz.df)

y   <- abaz.df$dna.conc
lbl <- abaz.df$sample

# Quick look at the data
# Data obvioulsy not normal and variances differ
tapply(y, lbl, mean)
tapply(y, lbl, sd)
boxplot(y ~ lbl)

# Do the regualar ANOVA:
fit1 <- aov(y ~ lbl)
summary(fit1)

# For Welch to work, drop the REF treatment, which has sd=0
bartlett.test(y ~ lbl)
fit2 <- oneway.test(y ~ lbl, var.equal = F)
fit2

y.red   <- y[-which(lbl=="REF")]
lbl.red <- as.factor(as.character(lbl[-which(lbl=="REF")]))
fit2a <- oneway.test(y.red ~ lbl.red, var.equal = F)
fit2a

# Check regular ANOVA without the REF treatment
fit1a <- aov(y.red ~ lbl.red)
summary(fit1a)


# Kruskal-Wallis. "Nonparametric" substitute for ANOVA
fit3 <- kruskal.test(y ~ lbl)
fit3

