library(frequtils)

y   <- gas$Propylbenzene
lbl <- as.factor(gas$ID)

boxplot(y ~ as.factor(lbl))
tapply(y, lbl, mean)

bartlett.test(y ~ lbl)


# Standard ANOVA model. Assumes homogeneous variance
fit1 <- aov(y ~ lbl)
summary(fit1)

# Welch ANOVA. Lifts homogeneous variance assumption
fit2 <- oneway.test(y ~ lbl, var.equal = F)
fit2

# Kruskal-Wallis. "Nonparametric" substitute for ANOVA
fit3 <- kruskal.test(y ~ lbl)
fit3

bon1 <- pairwise.t.test(y, lbl, p.adjust.method = "bonferroni", pool.sd = T)
fdr1 <- pairwise.t.test(y, lbl, p.adjust.method = "fdr", pool.sd = T)

bon2 <- pairwise.t.test(y, lbl, p.adjust.method = "bonferroni", pool.sd = F)
fdr2 <- pairwise.t.test(y, lbl, p.adjust.method = "fdr", pool.sd = F)

bon3 <- pairwise.wilcox.test(y, lbl, p.adjust.method = "bonferroni")
fdr3 <- pairwise.wilcox.test(y, lbl, p.adjust.method = "fdr")


