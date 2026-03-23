library(frequtils)

data("transactions")

boxplot(suspicion.score~transaction.type, data = transactions)

nfs <- transactions[transactions$transaction.type == "not.fraud", 1]
fs  <- transactions[transactions$transaction.type == "fraud", 1]

hist(fs)
hist(nfs)
boxplot(fs, nfs)

two.sample.bs.hyp.for.pop.compare(A.samp = fs, B.samp = nfs, confidence = 0.95, alternative ="two.sided")

