#Playing with PCA
library(frequtils)
library(rgl) #library for interactive 3D-plots
library(pls) #library with some nice functions for chemometrics

#Pick some data:
X   <- gas[,2:ncol(gas)]
lbl <- as.factor(gas[,1])

#Number of variab;es. We'll use this later:
p<-dim(X)[2]

#Compute PCs 
pca.model<-prcomp(X,center=T,scale=T)

#Plot histogram of PC variances:
plot(pca.model)

#Look at numerical values of PC variances:
summary(pca.model)

#Check out the titles of all the output categories from prcomp:
attributes(pca.model)

#Do a 2D PCA "scores" plot:
M<-2                                              #Pick dimension
Z<-predict(pca.model)[,1:M]                       #Grab PCA scores
plot(Z[,1],Z[,2],col=lbl,pch=16,xlab="PC1",ylab="PC2",main="PC-scores") #Plot
text(Z[,1],Z[,2],labels=lbl,font=2,adj=1.5)       #Group lables
text(Z[,1],Z[,2],labels=1:nrow(X),font=1,adj=0)   #Obs. lables

#Do a 3D PCA "scores" plot:
M<-3                                              #Pick dimension
Z<-predict(pca.model)[,1:M]                       #Grab PCA scores
plot3d(Z[,1],Z[,2],Z[,3],type="s",radius=0.1,col=as.numeric(lbl),aspect="iso",xlab="PC1",ylab="PC2",zlab="PC3")
text3d(Z[,1],Z[,2],Z[,3],text=lbl,font=1,adj=1.5) #Group lables
#snapshot3d("pls3d.png",fmt="png")


#Do a bar plot for a PC-Loading
Apc   <-pca.model$rotation[,1:2]                             #Pick loadings
lampc <- pca.model$sdev
barplot(lampc[2]*Apc[,2],names.arg=1:p,xlab="variable #", ylab="Loading Value")
