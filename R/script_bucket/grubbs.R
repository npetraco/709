library(outliers)

x <- c(266, 273, 273, 274, 275, 276, 276, 276, 277, 277,
       278, 278, 278, 279, 279, 280, 281, 282, 282, 284)

# Check data's normality visually:
hist(x)
boxplot(x)

qqnorm(x)
qqline(x)

zx <- (x-mean(x))/sd(x) # Standardize scale
qqnorm(zx, ylim = c(-3,3))
qqline(zx)


# Grubbs test(s): Clunky.....
grubbs.test(x, type = 10)               # Ha: low val outlier
grubbs.test(x, type = 10, opposite = T) # Ha: high val outlier
grubbs.test(x, type = 11)               # Ha: ends outliers
grubbs.test(x, type = 20)               # Ha: lowest two outliers

