library(EnvStats)

# Some data from Rosner's 1983 paper:
x <- c(-0.25, 0.68, 0.94, 1.15, 1.20, 1.26, 1.26, 1.34, 1.38, 1.43, 1.49, 1.49, 1.55, 1.56,
       1.58, 1.65, 1.69, 1.70, 1.76, 1.77, 1.81, 1.91, 1.94, 1.96, 1.99, 2.06, 2.09, 2.10,
       2.14, 2.15, 2.23, 2.24, 2.26, 2.35, 2.37, 2.40, 2.47, 2.54, 2.62, 2.64, 2.90, 2.92,
       2.92, 2.93, 3.21, 3.26, 3.30, 3.59, 3.68, 4.30, 4.64, 5.34, 5.42, 6.01)

hist(x)
boxplot(x, horizontal = T)

# Check data normality:
x.std <- (x-mean(x))/sd(x)
qqnorm(x)
qqnorm(x.std)
qqline(x.std)

k <- 10 # Speculate there are up to 10 outliers
rosnerTest(x, k = k, alpha = 0.05, warn = TRUE)

