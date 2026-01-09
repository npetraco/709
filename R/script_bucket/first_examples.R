# Enter in the vector of data:
dat <- c(-2*pi, -1.5*pi, -1*pi, -0.5*pi, 0, 0.5*pi, 1*pi, 1.5*pi, 2*pi)

# Example of USING a function:
out <- sin(dat)
out

# seq generates a sequence:
x <- seq(from= -5*pi, to= 2.8*pi, length.out = 100)
y <- cos(x)

plot(x, y, type="l")

# Enter some data in a Matrix:
X <- rbind(
  c(0.99, 0.92, 0.84, 0.39, 0.36),
  c(0.87, 0.73, 0.80, 0.76, 0.87),
  c(0.50, 0.11, 0.14, 0.43, 0.62),
  c(0.08, 0.41, 0.68, 0.49, 0.02)
)

# What happens when we execute each of these line?:
X
X[1,3]
X[2,]
X[,1]
X[5,]
X[5]


