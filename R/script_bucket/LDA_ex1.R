library(frequtils)
library(MASS) #Library which has LDA/CVA
library(rgl) 

data("gas")

X   <- as.matrix(gas[,2:ncol(gas)])
lbl <- as.factor(gas[,1])

#Fit an LDA classification model with the PCA-pretreated data
lda.model<-lda(X,lbl)

#"Look at" some of the clustering uncovered (if any) by computing the LDA "scores":
Acv<-lda.model$scaling
Zcv<-X %*% Acv

#Look at three LDA score sets at a time and examin if you see any evidence of clustering:
plot3d(Zcv[,1],Zcv[,2],Zcv[,3],type="s",radius=1,col=as.numeric(lbl.tool),aspect="iso",xlab="LD1",ylab="LD2",zlab="LD3")
text3d(Zcv[,1],Zcv[,2],Zcv[,3],text=lbl.tool,font=1,adj=1.5) #Group lables
text3d(Zcv[,1],Zcv[,2],Zcv[,3],text=1:50,font=1,adj=1.5)     #Observation lables


#-------------------ERROR RATE ESTIMATION-----------------------------------
#OK, now lets use our LDA model to ESTIMATE the error rate that we would get if we had a larger data set:

#The trick is to do the LDA with CV=TRUE (HOO-CV classification):
lda.model<-lda(X,lbl,CV=TRUE)

#HOO-CV predictions of the I.D.s:
cv.lbls<-lda.model$class

#If we got some wrong, which ones were they? (some quick and dirty R):
sameQ <- cv.lbls==lbl
data.frame(1:nrow(X), lbl, cv.lbls, sameQ)

#Compute the error rate estimate (as a percentage):
(1-sum(cv.lbls==lbl)/length(lbl))*100


