#Library which has LDA
library(MASS)

#Library for interactive 3D-plots
library(rgl) 

#Navigate to the 5 tools toolmark data file and load it:
tool.data <- read.csv(file.choose(), header=F)
X.tool <- tool.data[,2:218]
lbl.tool <- tool.data[,1]

#First let's start with PCA to get an "idea" what the data "looks like":
pca.model<-prcomp(X.tool,center=TRUE,scale=FALSE)

#Plot histogram of PC variances (A "scree" plot):
plot(pca.model)

#Look at numerical values of PC variances:
summary(pca.model)

#Do a 2D PCA "scores" plot:
M <- 2                                              #Pick dimension
Z <- predict(pca.model)[,1:M]                       #Grab PCA scores
plot(Z[,1],Z[,2], col=lbl.tool, pch=16, xlab="PC1", ylab="PC2", main="PC-scores") #Plot
text(Z[,1],Z[,2], labels=lbl.tool, font=2, adj=1.5)                               #Group lables
text(Z[,1],Z[,2], labels=1:nrow(X.tool), font=1, adj=0)                           #Observation number lables

#Do a 3D PCA "scores" plot:
M <- 3                                              #Pick dimension
Z <- predict(pca.model)[,1:M]                       #Grab PCA scores
plot3d(Z[,1],Z[,2],Z[,3],type="s",radius=0.05,col=as.numeric(lbl.tool),aspect="iso",xlab="PC1",ylab="PC2",zlab="PC3")
text3d(Z[,1],Z[,2],Z[,3],text=lbl.tool,font=1,adj=1.5)   #Group lables

#---------------------------------------------------------------------
#Fit an LDA classification model:

#Usually we start the LDA fitting process wuth PCA to remove some "dependence" between the variables.
#****NOTE: The more dimentions you use, the more "information" you keep for the classification model.
#****NOTE ALSO: This "information" could just be noise (bad...)
M <- 3                                              #Pick dimension
Z <- predict(pca.model)[,1:M]                       #Grab PCA scores

#Fit an LDA classification model with the PCA-pretreated data
lda.model<-lda(Z,lbl.tool)

#"Look at" some of the clustering uncovered (if any) by computing the LDA "scores":
Acv<-lda.model$scaling
Zcv<-Z %*% Acv

#Look at three LDA score sets at a time and examin if you see any evidence of clustering:
plot3d(Zcv[,1],Zcv[,2],Zcv[,3],type="s",radius=0.2,col=as.numeric(lbl.tool),aspect="iso",xlab="LD1",ylab="LD2",zlab="LD3")
text3d(Zcv[,1],Zcv[,2],Zcv[,3],text=lbl.tool,font=1,adj=1.5) #Group lables
text3d(Zcv[,1],Zcv[,2],Zcv[,3],text=1:50,font=1,adj=1.5)     #Observation lables


#-------------------ERROR RATE ESTIMATION-----------------------------------
#OK, now lets use our LDA model to ESTIMATE the error rate that we would get if we had a larger data set:

#The trick is to do the LDA with CV=TRUE (HOO-CV classification):
lda.model<-lda(Z,lbl.tool,CV=TRUE)

#HOO-CV predictions of the I.D.s:
cv.lbls<-lda.model$class

#Compute the error rate estimate (as a percentage):
(1-sum(as.numeric(cv.lbls)==as.numeric(lbl.tool))/length(lbl.tool))*100

#If we got some wrong, which ones were they? (some quick and dirty R):
cbind(1:50,as.numeric(cv.lbls)==as.numeric(lbl.tool), as.numeric(cv.lbls), as.numeric(lbl.tool))
