library(frequtils)
library(MASS)
library(rgl)

data(gas)
lbl <- gas$ID
X   <- gas[,2:16]

pca.model <- prcomp(X, center = T, scale = T)
plot(pca.model)
summary(pca.model)

#Do a 3D PCA "scores" plot:
M <- 3                                              #Pick dimension
Z <- predict(pca.model)[,1:M]                       #Grab PCA scores
#plot3d(Z[,1],Z[,2],Z[,3],type="s",radius=0.15,col=as.numeric(lbl),aspect="iso",xlab="PC1",ylab="PC2",zlab="PC3")
plot3d(Z[,1],Z[,2],Z[,3],type="s",radius=0.15,col=as.numeric(lbl),xlab="PC1",ylab="PC2",zlab="PC3")
text3d(Z[,1],Z[,2],Z[,3],text=lbl,font=1,adj=1.5) #Group lables

# Show 2D surface KDE-fit pdf of CVA processed data:
Mpc <- 15                                             #Pick dimension
Zpc <- predict(pca.model)[,1:Mpc]                     #Grab PCA scores

#Do LDA (also called CVA)
lda.model <- lda(Zpc,lbl)

#Canonical Variate "loadings". Called LDs:
Mcv <- 15
Acv <- lda.model$scaling[,1:Mcv]

#Compute CVA "scores":
Zcv <- Zpc %*% Acv

#Check 2D CVA "scores" plot:
plot(Zcv[,1],Zcv[,2],col=lbl,pch=16,xlab="LD1",ylab="LD2",main="CVA-scores") #Plot
text(Zcv[,1],Zcv[,2],labels=lbl,font=2,adj=1.5)       #Group lables
text(Zcv[,1],Zcv[,2],labels=1:nrow(X),font=1,adj=0)   #Obs. lables

#Check 3D CVA "scores" plot:
plot3d(Zcv[,1],Zcv[,2],Zcv[,3],type="s",radius=0.9,col=as.numeric(lbl),aspect="iso",xlab="LD1",ylab="LD2",zlab="LD3")
text3d(Zcv[,1],Zcv[,2],Zcv[,3],text=lbl,font=1,adj=1.5) #Group lables

# Kernel density estimate (KDE)-fit to 2D CVA "scores" plot and visualization:
x <- Zcv[,1]
y <- Zcv[,2]

ngrid  <- 40
denobj <- MASS::kde2d(x, y, n=ngrid)
den.z  <- denobj$z
xgrid  <- denobj$x
ygrid  <- denobj$y

zscale <- 1
nbcol  <- 256
color  <-  rev(rainbow(nbcol, start = 0/6, end = 2/6)) #Color band width
zcol   <- cut(den.z, nbcol)   
persp3d(xgrid, ygrid, zscale*den.z, aspect = c(1.5,1,0.55), col=color[zcol], alpha=0.75)
spheres3d(x, y, rep(0,n), radius=1, color=lbl) # Add in data points

