library(frequtils)

# Slice out the data of interest:
row.idxs <- which(linton$Condition == "GEN" & 
                  linton$Segment   == 1)
dat      <- linton[row.idxs, ]
head(dat)

vel <- dat$AverageAbsoluteVelocity

# This usually doesn't work for decimal data! 
table(vel)

# Histogram, with quick and dirty KED around it:
hist(vel, probability = T)
dk <- density(vel)         # The kernel density estimate
lines(dk$x, dk$y, lwd=3)   # Plot it over the histogram

max.idx <- which.max(dk$y)
dk$x[max.idx]              # Approx mode (max) from the KDE

# Plot the mode on the KDE:
points(dk$x[max.idx], dk$y[max.idx], pch=16, col="red")
