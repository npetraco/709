N     <- 100     # Population (N): Total number of items (e.g., packages) in the seizure.
p.pos <- 0.7     # Fraction of drug-containing items expected or claimed to be in the seizure
conf  <- 0.95    # Stipulated minimum confidence level
alp   <- 1-conf

k <- 1:100 # Sample Sizes
x <- k   # Number of positives in sample

K <- ceiling(N*p.pos) # cf. ENFSI doc pp.11 Table 2
m <- K-1              # The number of drug-containing items expected to garantee at least p.pos
n <- N-m

# p-values and effective confidences:
#Pr(X>=x) =  Pr(X=x)                            + Pr(X>x)
pvals     <- dhyper(x = x, m = m, n = n, k = k) + 1-phyper(q = x, m = m, n = n, k = k)
eff.confs <- (1-pvals)*100

# Tabulate:
conf.tab <- data.frame(k, eff.confs)
conf.idx <- which(eff.confs >= conf*100)[1]
conf.tab
conf.tab[conf.idx,]

# Plot:
# Significance plot:
plot(k, pvals, typ="h", xlab="sample size (k)", ylab="p-value", main=paste0("H0: pi <= ", p.pos, " vs. Ha: pi > ", p.pos))
abline(a = alp, b=0) # Significance threshold line

# Confidence plot:
plot(k, eff.confs, typ="h", xlab="sample size (k)", ylab="Conf. (%)", main=paste0("H0: pi <= ", p.pos, " vs. Ha: pi > ", p.pos))
abline(a = conf*100, b=0) # Confidence threshold line

