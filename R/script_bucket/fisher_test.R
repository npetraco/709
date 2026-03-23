O.tab <- rbind(
  c(10,40),
  c(30,0)  
)

# Fisher exact test:
fisher.fit <- fisher.test(O.tab)
fisher.fit
