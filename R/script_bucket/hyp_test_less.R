# Question of interest: Is there evidence that the mean mass is less than 50.000g ? 

x <- c(49.9996,49.9994,49.9993,49.9996,49.9995,49.9995,49.9995,49.9994,49.9995,49.9994)
mean(x)

# NULL HYPOTHESIS:        mu >= 50.000g
# ALTERNATIVE HYPOTHESIS: mu < 50.000g

t.test(x, alternative = "less", mu = 50.000, conf.level = 0.95)

# The meaning of the output for t.test: 

# Can we REJECT the NULL HYPOTHESIS? => Is there evidence that the mean mass is less than 50.000g?
# p-value = 1.352e-08
#
# So p < 0.05. REJECT the NULL HYPOTHESIS. The data is "unlikely" under the null.
# Another interperitation: If the Null were true, we wouldn't see data like this too often.
# BUT: We CANNOT SAY that the data is more likely under the Alternative hypothesis.

# 95 percent confidence interval:
#  -Inf 49.99952
# This means: given your sample, the GREATEST value the mean could be is 49.99952, with 95% "plausibility"
