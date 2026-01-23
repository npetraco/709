library(frequtils)
# Slice out the data of interest:
row.idxs <- which(linton$Condition == "GEN" & linton$Segment   == 1)

dat <- linton[row.idxs, ]
vel <- dat$AverageAbsoluteVelocity

# Percentiles, Quantiles and Histogram
quantls <- quantile(vel, probs = c(0.01, 0.99))
quantls

hist(vel)
points(quantls, c(0,0), pch=16)

# Inverse of the quantile function:
percs <- percentiles(vel, quantiles = c(0.674491, 22.572147))
percs * 100
