mu.log    <- 5.5
sigma.log <- 32

# Pr(-7 < log(X) < 6): (cf. log-amounts in cv_rsd.R)
plnorm(6, meanlog=mu.log, sdlog=sigma.log) - plnorm(-7, meanlog=mu.log, sdlog=sigma.log)

# How many ng is the range?:
exp(6)
exp(-7)
