# Data and CRM reference 
CRM <- 150
x   <- c(117.7, 97.6, 147.4, 139.6, 135.5, 130.8, 141.0, 137.6, 115.0, 134.0, 122.3, 148.0, 121.6, 132.5, 119.8)

# a. Sample average:
mu.hat <- mean(x)
mu.hat

# b. Sample SD:
sdx.hat <- sd(x)
sdx.hat

# c. Bias and %Bias:
bias         <- mu.hat - CRM
percent.bias <- bias/CRM * 100
bias
percent.bias

#d.  Relative SD:
rel.sdx <- sdx.hat/mu.hat * 100
rel.sdx