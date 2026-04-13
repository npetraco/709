library(frequtils)

A <- c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
B <- c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)

boxplot(A,B)

avg.AB <- colMeans(rbind(A,B))
Apc <- A - avg.AB
Bpc <- B - avg.AB

data.frame(A,B,avg.AB,Apc,Bpc,A-B)
boxplot(Apc, Bpc, A-B, names=c("A-avg(AB_i)","B-avg(AB_i)","A-B"))

# Paired two-sample bootstrap test for mean equivalence
bs.test(A, B, paired=T, conf.level = 0.95, alternative = "two.sided")

# Compare to t-test version
t.test(A, B, paired = T, conf.level = 0.95, alternative = "two.sided")



