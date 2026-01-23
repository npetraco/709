library(mlbench)

data(Glass)
RI <- Glass[,1]

hist(RI)

plot(ecdf(RI), ylab="F(x)", xlab="x=RI", main="Empirical CDF of RIs")

# What percentage of the RI data is <= 1.51594?
x  <- 1.51594
Fx <- ecdf(RI)  # The ECDF
Fx(x) # 1.51594 is as large or larger than about 12% of the RI data


# Evaluate Pr(a<RI<=b):
a <- 1.51593
b <- 1.51820

Fx <- ecdf(RI) # Make the ecdf from the data

# Pr(a<RI<=b)
Fx(b) - Fx(a)

# Also another (fancy) way to do Pr(a<RI<=b):
length(which(RI > a & RI <= b))/length(RI)
