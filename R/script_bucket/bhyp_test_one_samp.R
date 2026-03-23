library(frequtils)
data(dropout.info)

all.dat <- do.call(rbind, dropout.info)
lhp     <- all.dat[all.dat[,3] == 0, 2] # Peak Present
lhd     <- all.dat[all.dat[,3] == 1, 2] # Peak Drop out 

hist(lhp)
hist(lhd)
