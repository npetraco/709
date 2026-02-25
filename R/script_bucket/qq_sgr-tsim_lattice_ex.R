library(frequtils)
library(lattice)


histogram(~sgr.tsim$X10.ft | sgr.tsim$gun.lbl, data=sgr.tsim)
histogram(~sgr.tsim$X20.ft | sgr.tsim$gun.lbl, data=sgr.tsim)
histogram(~sgr.tsim$X30.ft | sgr.tsim$gun.lbl, data=sgr.tsim)
histogram(~sgr.tsim$X40.ft | sgr.tsim$gun.lbl, data=sgr.tsim)
histogram(~sgr.tsim$X50.ft | sgr.tsim$gun.lbl, data=sgr.tsim)

st.idxs <- which(sgr.tsim$gun.lbl=="Stevens")
rm.idxs <- which(sgr.tsim$gun.lbl=="Remington")
stx     <- sgr.tsim$X50.ft[st.idxs]
rmx     <- sgr.tsim$X50.ft[rm.idxs]

cbind(
  sort(stx),
  sort(rmx),
  ppoints(n = 30)
)


qqplot(stx, rmx)
abline(0, 1, col = "red")

# lattice QQ-plots:
dat <- data.frame(stack(sgr.tsim[1:5]), rep(sgr.tsim$gun.lbl, 5))
colnames(dat) <- c("sqrt.area", "dist", "gun")

qq(gun ~ sqrt.area | factor(dist), data = dat,
   f.value = ppoints(30), type = c("p", "g"), aspect = 1)

qq(gun ~ sqrt.area | factor(dist), data = dat,
   type = c("p", "g"), aspect = 1)

qq(gun ~ sqrt.area | factor(dist), data = dat, aspect = 1)

qq(gun ~ sqrt.area | factor(dist), data = dat)

qq(gun ~ sqrt.area | factor(dist), data = dat)

dat.st <- dat[which(dat$gun=="Stevens"),]
histogram(~sqrt.area | dist, data=dat.st, main="Stevens")

dat.rm <- dat[which(dat$gun=="Remington"),]
histogram(~sqrt.area | dist, data=dat.rm, main="Remington")

# Standardize the data to put it all on the same scale and then look at the QQ plots
dat2 <- sgr.tsim[1:5]
dat2 <- scale(dat2, center = T, scale = T)[,]
dim(dat2)
colMeans(dat2)                    # check: mean=0?
apply(dat2, MARGIN = 2, FUN = sd) # check: sd=1?

dat2 <- data.frame(stack(as.data.frame(dat2)), rep(sgr.tsim$gun.lbl, 5))
colnames(dat2) <- c("sqrt.area", "dist", "gun")

qq(gun ~ sqrt.area | factor(dist), data = dat2,
   type = c("p", "g"), aspect = 1)
