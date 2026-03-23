O.tab <- rbind(
  c(144,210),
  c(260,399)  
)

N      <- sum(O.tab)
r.tots <- rowSums(O.tab)
c.tots <- colSums(O.tab)

E.tab <- outer(rowSums(O.tab), colSums(O.tab))/N
E.tab

# Chi-square test:
Xsq.fit <- chisq.test(O.tab, correct = T)
Xsq.fit
