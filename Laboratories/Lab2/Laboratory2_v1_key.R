library(frequtils)

data(linton)

# 1.
# Slice out the data of interest: Genuine signature, Segment 1 properties for all Subjects:
row.idxs <- which(linton$Condition == "GEN" & linton$Segment   == 1)

dat      <- linton[row.idxs, ]
head(dat)

tim <- dat$Duration # duration times

# Histogram, boxplot, sample mean, median, etc:
#1a-GEN.
hist(tim)
boxplot(tim)

#1c-GEN.
mean(tim)

#1d-GEN.
median(tim)

#1e-GEN.
sd(tim)

#1f-GEN.
mad(tim)

#1g-GEN.
range(tim)


# Slice out the data of interest: Disguised signature, Segment 1 properties for all Subjects:
row.idxs2 <- which(linton$Condition == "DNM" & linton$Segment   == 1)

dat2      <- linton[row.idxs2, ]
head(dat2)

tim2 <- dat2$Duration

# Histogram, sample mean and median:
#1b-DNM.
hist(tim2)
boxplot(tim2)

#1c-DNM.
mean(tim2)

#1d-DNM.
median(tim2)

#1e-DNM.
sd(tim2)

#1f-DNM.
mad(tim2)

#1g-DNM.
range(tim2)

#1h
# Compare graphically
boxplot(tim, horizontal = T, range=0, ylim=c(0,0.8), main="Genuine, Duration-Seg1")
boxplot(tim2, horizontal = T, range=0, ylim=c(0,0.8), main="Disguised, Duration-Seg1")

hist(tim, xlim=c(0,0.8), main="Genuine, Duration-Seg1")
hist(tim2, xlim=c(0,0.8), main="Disguised, Duration-Seg1")



# 2
#2a,b.
data(gas)
gas.sub <- gas[,2:6]
colnames(gas.sub)
pairs(gas.sub) # positive linear relationships between components

#1c,d,e
library(lattice)
gas.sub.stacked <- stack(gas.sub)
colnames(gas.sub.stacked) <- c("abundance", "component")
histogram(~abundance | component, data=gas.sub.stacked)
bwplot(~abundance | component, data=gas.sub.stacked)
# Seems m.Ethyltoluene and m.p.Xylene differ most.


# 3.
data("shedder")
#3a.
mns <- rowMeans(shedder[,3:5])
hist(mns)

#3b.
sds <- apply(shedder[,3:5], MARGIN = 1, FUN = sd)
hist(sds)

#3c,d.
cvs <- sds/mns*100
shedder.cvs <- data.frame(shedder$location, cvs)
colnames(shedder.cvs) <- c("location", "cvs")
min(shedder.cvs$cvs)
max(shedder.cvs$cvs)

histogram(~cvs | location, shedder.cvs)
# There is A LOT of variation in the amount of touch DNA recovered

#3e.
rangs <- apply(shedder[,3:5], MARGIN = 1, FUN = range)
rangs <- t(rangs)
rangs <- apply(rangs, MARGIN = 1, FUN = diff)
min(rangs)
max(rangs)
which(rangs == max(rangs))
shedder[247,]

which(cvs == max(cvs))
shedder[26,]
cvs[26]
shedder[247,]
cvs[247]

# Consistent with cv%, there is A LOT of variability on the amount of touch DNA recovered.
# Perhaps observation 247 is an outlier?
