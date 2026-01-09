library(mlbench) 

# Load some sample data
data("Glass") 
ele.cont <- Glass[,2:9]
ele.nme  <- colnames(Glass)[2:9]
id.num   <- Glass$Type

# Translate id.nums to names with dictionary trick:
dict <- c("1"="bldg.flot", "2"="bldg.nflot", "3"="veh.flot", "5"="contnr", "6"="tabwre", "7"="headlgt")
id.nme <- as.vector(dict[as.character(id.num)])

# Stack
typ.num <- rep(id.num, length(ele.nme))
typ.nme <- rep(id.nme, length(ele.nme))
dat     <- data.frame(stack(ele.cont), typ.num, typ.nme)
dim(dat)

# mean amount of elements across all glasses
vls <- tapply(dat$values, INDEX = dat$ind, FUN = mean)
pie(vls, labels = names(vls))

# mean amount of element per glass type
ele.nme
ele <- "Si"
dat.ele <- dat[dat$ind==ele,]
vls.ele <- tapply(dat.ele$values, INDEX = dat.ele$typ.nme, FUN = mean)
pie(vls.ele, labels = names(vls.ele), main=ele)

# Plot an array of pie charts:
par(mfcol = c(2, 4))
for(i in 1:length(ele.nme)){
  ele <- ele.nme[i]
  dat.ele <- dat[dat$ind==ele,]
  vls.ele <- tapply(dat.ele$values, INDEX = dat.ele$typ.nme, FUN = mean)
  pie(vls.ele, labels = names(vls.ele), main=ele)
}
par(mfcol = c(1, 1))
