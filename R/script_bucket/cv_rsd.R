library(frequtils)

# cv% ethylbenzene in gasoline
data(gas)
?gas

hist(gas$Ethylbenzene)
mean(gas$Ethylbenzene)
sd(gas$Ethylbenzene)
cv <- sd(gas$Ethylbenzene)/mean(gas$Ethylbenzene)*100
cv



# Shedder DNA quantity:
data("shedder")
?shedder

# left upper shoulder (LU):
row.idxs <- which(shedder$location=="LU")
dat      <- shedder[row.idxs, ]
hist(dat$DNA.amt1)

# cv%:
cvp <- sd(dat$DNA.amt1)/mean(dat$DNA.amt1) * 100

mean(dat$DNA.amt1)
sd(dat$DNA.amt1)
cvp

# DNA shed at LU per donor: cv%
donor.means <- rowMeans(dat[,3:5])
donor.sds   <- apply(dat[,3:5], MARGIN = 1, FUN = sd)
donor.cvps  <- donor.sds/donor.means * 100

hist(donor.cvps, bre=20)
round(donor.cvps, 2)
