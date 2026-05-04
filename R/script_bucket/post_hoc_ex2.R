library(frequtils)
library(dafs)
library(dunn.test)

data(abaz.df)

y   <- abaz.df$dna.conc
lbl <- abaz.df$sample

# Quick look at the data
# Data obvioulsy not normal and variances differ
tapply(y, lbl, mean)
boxplot(y ~ as.factor(lbl))

# Kruskal-Wallis:
fit <- kruskal.test(y ~ lbl)
fit


# Non-parametric post hoc testing:
pairwise.wilcox.test(y, lbl, p.adjust.method = "fdr")
pairwise.tests(y, lbl, confidence = 0.95, type = "wilcox.test", p.adjust.method = "fdr")
dunn.test(y, lbl, alpha=0.05, kw=T, method="bh", list=T, table=F)

pairwise.tests(y, lbl, confidence = 0.95, type = "wilcox.test", p.adjust.method = "bonferroni")
dunn.test(y, lbl, alpha=0.05, kw=T, method="bonferroni", list=T, table=F)

