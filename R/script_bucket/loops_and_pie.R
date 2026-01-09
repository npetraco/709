library(mlbench) 

# Load some sample data
data("Glass") 

head(Glass)

# **** Looping ****
# Compute average of each element:
ele <- Glass[, 2:8] # Slice out columns of elements
dim(ele)

ele.avgs <- array(-1, c(ncol(ele))) # Allocate space to hold element averages
for(i in 1:ncol(ele)) {
  ele.avg     <- mean(ele[,i]) # compute average of element
  ele.avgs[i] <- ele.avg       # store average
}

names(ele.avgs) <- colnames(ele) # Optional: label the elements
ele.avgs

pie(ele.avgs) # Make a pie chart
