library(frequtils)
library(dixonTest)
library(data.table)

data("shedder")

# View the data in stripchart form:
unique(shedder$location)
loc          <- "LW"
dat2         <- shedder[shedder$location==loc, c(1,3,4,5)]
num.subjects <- nrow(dat2)

# Re-shape the data from "wide" format to "long" format
dat3 <- melt(dat2, id.vars=c("subjectID"))
dat3 <- cbind(dat3, log(dat3$value))
colnames(dat3) <- c("subjectID", "variable", "value", "log.value")

stripchart(log.value ~ as.numeric(subjectID), group.names = 1:num.subjects, data=dat3,
           xlab="Subject ID", ylab="log(DNA amt.)", vertical=T, pch=16, col = 1:num.subjects)




loc <- "LW"
dat <- shedder[shedder$location=="LW", c(3,4,5)]

conf  <- 0.95
alpha <- 1 - conf
dinfo <- array(0, c(nrow(dat), 3))
for(i in 1:nrow(dat)) {

  x <- log(as.numeric(dat[i,]))

  tinfo      <- dixonTest(x, alternative = "two.sided", refined = T)
  outliersQ  <- (tinfo$p.value < alpha)
  dinfo[i, ] <- c(tinfo$statistic, tinfo$p.value, outliersQ)

}

colnames(dinfo) <- c("Q-statistic", "p-value", "Poss. Outliers?")
dinfo
