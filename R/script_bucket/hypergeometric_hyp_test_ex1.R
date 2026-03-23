# Ref: ENFSI doc: https://enfsi.eu/wp-content/uploads/2017/06/DWG-SGL-002-vers001_Hypgergeometric_CalculationBackground_And_Validation_2012-12-07.pdf
N     <- 200*10 # population (seizure) size 
p.pop <- 0.8    # Fraction to be tested of pills claimed to be positive for MDMA to be in the seizure
conf  <- 0.95
alp   <- 1-conf

k <- 4*10 # Sample Size. Number of items actually tested.
x <- k    # Number of MDMA-containing pills found in the sample of size k.

K <- ceiling(N*p.pop) # expected number of MDMA-containing pills in the seizure | p.pop. Proxy for p.pop
m <- K-1              # expected number of MDMA-containing pills in the seizure BUT if H0 is rejected, guarantees AT LEAST p.pop of pills in the seizure are positive.  cf. ENFSI doc Section 4 and pp.11 Table 2.
n <- N-m

# H0: p.pop <= 0.8 vs. Ha: p.pop > 0.8
# p-value:
# Pr(pi > p.pop | N, m, k) = Pr(X>=x | N, m, k) = Pr(X=x | N, m, k) + Pr(X>x | N, m, k)
pval <- dhyper(x = x, m = m, n = n, k = k) + 1-phyper(q = x, m = m, n = n, k = k)
pval
pval < alp # Reject H0? 


# Plot of the NULL distribution:
xx <- 1:(k+5)
yy <- dhyper(x = xx, m = m, n = n, k = k)
plot(xx,yy,typ="h", xlab="x (# drug-containing items)", ylab="Pr(x|N,m,k)", main="Null Dist. (H0)")

points(x = x, y = 0, pch=16, col="red")        # Where the data ACTUALLY falls wrt H0
points(x = xx[37], y = 0, pch=16, col="green") # H0@conf cutoff. For x past here REJECT H0.
#1-sum(yy[37:length(xx)])
#1-sum(yy[37:length(xx)]) >= conf
