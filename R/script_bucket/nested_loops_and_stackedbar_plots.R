library(mlbench) 

# Load some sample data
data("Glass") 

head(Glass)

# Compute average element abundance for each glass type:
ele <- Glass[, 2:8] # Slice out columns of elements
lbl <- Glass[, 10]  # Slice out the glass type, a set of labels
dim(ele)            # Sanity check
lbl                 # Sanity check
lbl.typ <- levels(lbl)

# **** Nested Looping ****
num.typ     <- length(lbl.typ)                # Number of unique glass type labels
num.ele     <- ncol(ele)                      # Number of elements
ele.typ.avg <- array(-1, c(num.ele, num.typ)) # Allocate storage for each element-glasstype average
dim(ele.typ.avg)                              # Sanity check

for(i in 1:num.ele) {
 ele.col  <- ele[,i]                  # Slice out an element column
 
 for(j in 1:num.typ) {
   # Now slice out the element abundances for each glass type:
   ele.typ.idxs <- which(lbl == lbl.typ[j]) 
   
   # Take the average element abundance for each glass type and store it
   ele.typ.avg[i,j] <- mean(ele.col[ele.typ.idxs])
 }
 
}

# Label the rows and columns of the element-glass type averages:
element.names   <- colnames(ele)
glass.typ.names <- c("bldg.flot","bldg.nflot","veh.flot","contnr","tabwre","headlgt")
rownames(ele.typ.avg) <- element.names
colnames(ele.typ.avg) <- glass.typ.names
ele.typ.avg

# Stacked bar plots:
barplot(ele.typ.avg ~ element.names, main="Elements in Glass Type", col=rainbow(6))
legend("topright", legend = glass.typ.names, fill = rainbow(6), cex=0.75)

barplot(t(ele.typ.avg) ~ glass.typ.names, main="Elements in Glass Type", col=rainbow(8))
legend("topright", legend = element.names, fill = rainbow(8), cex=0.5)
