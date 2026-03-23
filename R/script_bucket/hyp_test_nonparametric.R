A <- c(0.50, 0.23, 1.10, 2.17, 0.24, 1.08, 0.41, 0.56, 0.89, 
       1.62, 0.92, 0.94, 0.61, 1.03, 1.28)
B <- c(1.19, 0.97, 1.32, 1.79, 1.50, 1.34, 0.96, 1.29, 1.48, 
       1.23, 0.88, 1.09, 1.03)

boxplot(A, B)

# Parametric Test:
var.test(A, B, alternative = "two.sided")
t.test(A, B, alternative = "two.sided", var.equal = F)

# Non-parametric Test:
wilcox.test(A, B, alternative = "two.sided")
