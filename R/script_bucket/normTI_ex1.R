library(tolerance)

# BAC QC data
x <- c(0.081, 0.078, 0.079, 0.076, 0.082, 0.077)

# a. Two-sided tolerance interval:
conf  <- 0.95
p     <- 0.83
alpha <- 1-conf
normtol.int(x, alpha = alpha, P = p, side = 2)



# b. Two-sided confidence interval for mean:
t.test(x, alternative = "two.sided", mu = 0.08, conf.level = conf)


# c. One-sided lower limit tolerance:
conf  <- 0.99
p     <- 0.9
alpha <- 1-conf
normtol.int(x, alpha = alpha, P = p, side = 1)
