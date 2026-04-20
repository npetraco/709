library(EnvStats)

# a. Plot
# Concentrations
x <- c(0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20)

# Intensity
y <- c(2.1, 5.0, 9.0, 12.6, 17.3, 21.0, 24.7, 28.4, 31.0, 32.9, 33.9)

# b. Fit initial linear regression:
plot(x, y)
fit <- lm(y ~ x)
summary(fit)
abline(fit)

# Check residuals:
eps <- residuals(fit)
hist(eps)

# Do the residuals look N(0, eps)-ish?: Not really . . . 
qqnorm(eps)
qqline(eps)

# Try Rosner test on the residuals of the full data set
k    <- 3 # Speculated max number of outliers
rosnerTest(eps, k = k, alpha = 0.05, warn = TRUE)
# Rosner is not super sensitive . . . 

# c. A hold-out procedure:
# Hold-Out between 0 and (highest) two points:
ho.mat <- NULL
for(i in 1:3) {
  n <- length(x)
  m <- i-1
  
  # Hold out data here:
  x.red <- x[1:(n-m)]
  y.red <- y[1:(n-m)]
  plot(x.red, y.red)
  
  # Fit reduced linear regression:
  fit.red     <- lm(y.red ~ x.red)
  fit.summary <- summary(fit.red)
  fit.anova   <- anova(fit.red)
  
  # Collect diagnositc information:
  coef.pvals  <- fit.summary$coefficients[,4]
  adj.r2      <- fit.summary$adj.r.squared
  sig.eps     <- fit.summary$sigma
  aov.pval    <- fit.anova[[5]][1]
  ho.mat <- rbind(ho.mat, c(coef.pvals, adj.r2, sig.eps, aov.pval))
  
}
colnames(ho.mat) <- c("b0.pval", "b1.pval", "adj.r2", "sig.eps", "aov.pval")
ho.mat
