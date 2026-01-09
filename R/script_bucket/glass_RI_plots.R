library(mlbench)

# Load some sample data
data("Glass") 
?Glass

# A histogram of RIs
hist(Glass$RI)

# Corresponding BW plots of RIs
boxplot(Glass$RI)
boxplot(Glass$RI, range=0, horizontal = T)
boxplot(Glass$RI ~ Glass$Type, xlab="Glass Label", ylab="RI")

# Scatter plots
plot(Glass$RI, Glass$Na)
plot(Glass$Na, Glass$Si)

# Strip chart
stripchart(as.numeric(Type)~Na, data=Glass,xlab="Glass#", ylab="Na conc.", vertical=F, pch=16)
