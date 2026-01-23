library(frequtils)

data(linton)

# Slice out the data of interest: Genuine signature, Segment 1 properties for all Subjects:
row.idxs <- which(linton$Condition == "GEN" & linton$Segment   == 1)

dat      <- linton[row.idxs, ]
head(dat)

vel <- dat$AverageAbsoluteVelocity

# Histogram, sample mean and median:
hist(vel)
mean(vel)
median(vel)

# But what's the mode though??
table(vel)

