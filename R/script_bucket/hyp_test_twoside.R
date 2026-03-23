# Question of interest: Is the mean mass == 50.000g ? 

x <- c(49.9996,49.9994,49.9993,49.9996,49.9995,49.9995,49.9995,49.9994,49.9995,49.9994)
mean(x)

# NULL HYPOTHESIS:        mu == 50.000g
# ALTERNATIVE HYPOTHESIS: mu != 50.000g

t.test(x, alternative = "two.sided", mu = 50.000, conf.level = 0.95)

# The meaning of the output for t.test: 

# Can we REJECT the NULL HYPOTHESIS? => Is there evidence that the mean mass is not equal to 50.000g?
# p-value = 2.704e-08
#
# So p < 0.05. REJECT the NULL HYPOTHESIS. The data is "unlikely" under the null.
# Another interperitation: If the Null were true, we wouldn't see data like this too often.
# BUT: We CANNOT SAY that the data is more likely under the Alternative hypothesis.

# 95 percent confidence interval:
#  49.99940 49.99954
# This means: given your sample, a set of plausible values for the mean is [49.99940 49.99954], with 95% "plausibility"
