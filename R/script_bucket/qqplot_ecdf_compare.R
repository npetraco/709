library(frequtils)

data("sgr.tsim")

st.idxs <- which(sgr.tsim$gun.lbl=="Stevens")
rm.idxs <- which(sgr.tsim$gun.lbl=="Remington")

st <- sgr.tsim[st.idxs,]$X10.ft
rm <- sgr.tsim[rm.idxs,]$X10.ft

# Datasets distributions (PMFs)
hist(st)
hist(rm)

# QQ-plot to compare dataset's distributions:
plot(sort(st), sort(rm))
abline(a = 0, b = 1)

qqplot(st,rm, main="QQ-plot st vs. rm")
abline(a = 0, b = 1)

# Data cdfs:
pp <- ppoints(30)
plot(sort(st), pp, typ="l")
plot(sort(rm), pp, typ="l")

Fx.st <- ecdf(st)
Fx.rm <- ecdf(rm)
plot(Fx.st)
plot(Fx.rm)

plot(st, Fx.st(st))
plot(rm, Fx.rm(rm))

# Overlay to ecdfs compare also:
plot(Fx.st, xlim=c(2,4.5))
par(new=T)
plot(Fx.rm, xlim=c(2,4.5), col="green")
