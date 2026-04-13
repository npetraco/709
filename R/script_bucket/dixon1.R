library(dixonTest)

# Dixon 1951 example
x <- c(39.96, 40.12, 40.16, 40.18, 40.18, 40.20)

hist(x)
boxplot(x, horizontal = T)

# Check for normality
qqnorm(x)
qqline(x)

x.std <- (x - mean(x))/sd(x)
qqnorm(x.std)
qqline(x.std)

# Dixon Q test:
dixonTest(x, alternative = "less")
dixonTest(x, alternative = "two.sided")

library(outliers)
dixon.test(x, type = 10)

