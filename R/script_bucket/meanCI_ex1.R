# Data (input quantities^GUM)
x <- c(1.52005,1.52003,1.52001,1.52004,1.52000,1.52001,1.52008,1.52011,1.52008,
       1.52008,1.52008)
n <- length(x)

# Estimate of measurand^GUM:
mu.hat <- mean(x)

# Standard uncertainty of the input quantities^GUM
sdx.hat <- sd(x)

# Standard uncertainty of the measurand^GUM
se.hat <- sd(x)/sqrt(n)

# Compute tc for given sample size and chosen confidence level
conf  <- 0.99
alpha <- 1-conf
tc    <- qt(1 - alpha/2, df = n-1)

# Put the CI together:
mu.hat.lo <- mu.hat - tc*se.hat
mu.hat.hi <- mu.hat + tc*se.hat
c(mu.hat.lo, mu.hat.hi)

