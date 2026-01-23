k <- 90   # Sample size
x <- 68   # Number of positives in sample
N <- 500  # Consignment size
p <- 0.7  # 70% of pills in consignment contain drug
m <- N*p  # number of positives in consignment
n <- N-m  # number of negatives in consignment

# Probability of 68 pillis in sample of 90 are positive
dhyper(x = x, m = m, n = n, k = k)
