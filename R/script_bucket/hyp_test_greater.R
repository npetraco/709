# Question of interest: Is there evidence that the mean mass is greater than or equal to 50.000g ? 

x <- c(49.9996,49.9994,49.9993,49.9996,49.9995,49.9995,49.9995,49.9994,49.9995,49.9994)
mean(x)

# NULL HYPOTHESIS:        mu <= 50.000g  Assumes the opposite of what you seek evidence for.
# ALTERNATIVE HYPOTHESIS: mu > 50.000g

t.test(x, alternative = "greater", mu = 50.000, conf.level = 0.95)

# The meaning of the output for t.test: 

# Can we REJECT the NULL HYPOTHESIS? => Is there evidence that the mean mass is greater than 50.000g?
# p-value = 1 (Wow!)
#
# So p is not < 0.05. CANNOT REJECT the NULL HYPOTHESIS. The data is "likely" under the null.
# Another interperitation: If the Null were true, we would see data like this often.

# 95 percent confidence interval:
#  49.99942      Inf
# This means: given your sample, the LEAST value the mean could be is 49.99942, with 95% "plausibility”
