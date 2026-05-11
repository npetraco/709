library(frequtils)
library(rgl)

data(gas)

x   <- gas$Ethylbenzene
y   <- gas$o.Xylene
z   <- gas$m.Ethyltoluene
lbl <- gas$ID

plot3d(x,y,z, col=lbl, xlab="Ethylbenzene", ylab="o-Xylene", zlab="m-Ethyltoluene")
#text3d(x,y,z, texts = lbl)
points3d(0,0,0, col="black", radius=1)


x   <- gas$C4.alkylbenzene.unid.4
y   <- gas$C3.alkylbenzene.unid.2
z   <- gas$X1.2.4..Trimethylbenzene

plot3d(x,y,z, col=lbl, xlab="", ylab="", zlab="", aspect="iso")
#text3d(x,y,z, texts = lbl)
points3d(0,0,0, col="black", radius=1)
lines3d(c(0,0.1),c(0,0),c(0,0), col="red", lwd=3)   # x-axis
lines3d(c(0,0),c(0,0.1),c(0,0), col="green", lwd=3) # y-axis
lines3d(c(0,0),c(0,0),c(0,0.1), col="blue", lwd=3)  # z-axis
