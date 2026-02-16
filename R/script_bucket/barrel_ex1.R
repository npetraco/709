# Data(Input values^GUM):
x <- c(18.438, 18.440, 18.468, 18.437)

# b. Sample average (measurand estimate^GUM):
mu.hat <- mean(x)
mu.hat

# c. Sample SD (standard measurement uncertainty^GUM):
sdx.hat <- sd(x)
sdx.hat

# d. SE of sample average (measurand standard uncertainty^GUM):
se.mu.hat <- sd(x)/sqrt(4)
se.mu.hat

#e.  %Relative SD (%Relative standard measurement uncertainty^GUM):
rel.sdx <- sdx.hat/mu.hat * 100
rel.sdx