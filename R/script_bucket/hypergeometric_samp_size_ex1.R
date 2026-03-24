# H0: The observed number of drug-containing items in the seizure is less than X, X<x. 
#     I.E. the fraction of drug-containing items in the seizure is less than the expected 
#          or claimed proportion to be in the seizure.

# Ha: The observed number of drug-containing items in the seizure is greater than or equal to X, X>=x. 
#     I.E. the fraction of drug-containing items in the seizure is greater than or equal to 
#          the expected or claimed proportion to be in the seizure.

N     <- 100     # Population (N): Total number of items (e.g., packages) in the seizure.
p.pos <- 0.7     # Fraction of drug-containing items expected or claimed to be in the seizure
conf  <- 0.95    # Stipulated minimum confidence level for which the the fraction of drug-containing items in the seizure is equal to or exceeds p.pos.
alp   <- 1-conf

k <- 1:100 # Sample Sizes (k): SAMPLE SIZEs. Number of items actually tested.
x <- k     # Number of drug-containing items found in the sample of size k. Here assumes no negatives are observed.

K <- ceiling(N*p.pos) # cf. ENFSI doc pp.11 Table 2
m <- K-1              # cf. ENFSI doc pp.11 Table 2: The number of drug-containing items expected or claimed to be in the seizure. Proxy for p.pos
n <- N-m

# Assuming no negatives are observed (x=k), what must the sample size be to reach the stipulated minimum
# confidence level if the fraction of drug-containing items in the seizure is greater then or 
# equal to (i.e. at least) p.pos?

# p-values and effective confidences:
#Pr(X>=x) =  Pr(X=x)                            + Pr(X>x)
pvals     <- dhyper(x = x, m = m, n = n, k = k) + 1-phyper(q = x, m = m, n = n, k = k)
eff.confs <- (1-pvals)*100

# Tabulate:
conf.tab <- data.frame(k, eff.confs)
conf.idx <- which(eff.confs >= conf*100)[1]
conf.tab
conf.tab[conf.idx,]


# Plots:
# Significance plot:
plot(k, pvals, typ="h", xlab="sample size (k)", ylab="p-value", main=paste0("H0: pi <= ", p.pos, " vs. Ha: pi > ", p.pos))
abline(a = alp, b=0) # Significance threshold line

# Confidence plot:
plot(k, eff.confs, typ="h", xlab="sample size (k)", ylab="Conf. (%)", main=paste0("H0: pi <= ", p.pos, " vs. Ha: pi > ", p.pos))
abline(a = conf*100, b=0) # Confidence threshold line

