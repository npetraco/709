library(ggplot2)

#Plot a few variables from the gasoline data set. Are they correlated?
qplot(o.Xylene,C4.alkylbenzene.unid.2, data=X.gas, color=lbl.gas)


#Scale data to see what happens:
#center => mean centering
#scale => variance scaling
#center and scale => autoscaling

#Center the data:
X.gas.centered<-data.frame(scale(X.gas,center=TRUE,scale=FALSE)[,])
qplot(o.Xylene,C4.alkylbenzene.unid.2, data=X.gas.centered, color=lbl.gas)

#Variance scale the data:
#Standard deviations of each variable:
sds<-sqrt(apply(X.gas,2,var))
X.gas.scaled<-data.frame(scale(X.gas,center=FALSE,scale=sds)[,])
qplot(o.Xylene,C4.alkylbenzene.unid.2, data=X.gas.scaled, color=lbl.gas)

var(X.gas[,3])
var(X.gas[,12])
var(X.gas.scaled[,3])
var(X.gas.scaled[,12])

#Autoscale the data:
X.gas.auto<-data.frame(scale(X.gas,center=TRUE,scale=TRUE)[,])
qplot(o.Xylene,C4.alkylbenzene.unid.2, data=X.gas.auto, color=lbl.gas)

mean(X.gas.auto[,3])
mean(X.gas.auto[,12])
var(X.gas.auto[,3])
var(X.gas.auto[,12])

#Try with Glass and Striation Pattern data sets
#Use all types of visualization plots (visualize_with_plots.R) on the transformed datasets

