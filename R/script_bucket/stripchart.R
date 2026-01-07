library(mlbench) 

# Load some sample data
data("Glass") 
?Glass

# Scatter plots
plot(Glass$RI, Glass$Na)
plot(Glass$Na, Glass$Si)

# Strip chart
stripchart(as.numeric(Type)~Na, data=Glass,xlab="Glass#", ylab="Na conc.", vertical=F, pch=16)
