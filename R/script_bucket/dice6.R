# Sample from 1 through 6, 1000 times:
n    <- 1000
samp <- sample(c(1,2,3,4,5,6), size=n, replace=T)
samp

sum(samp==3)/n # Frequency of rolling a 3 in 1000 rolls


# Roll a die 1 through 1000 times and compute the frequency of a 3.
# For each number of rolls, repeat the process (i.e. trial) 100 times:
n          <- 1000
num.trials <- 100
dsim       <- array(-1, c(n, num.trials))
for(i in 1:n){

  for(j in 1:num.trials){
    samp <- sample(c(1,2,3,4,5,6), size=i, replace=T)

    freq3 <- sum(samp==3)/i# Frequency of rolling a 3 in 1000 rolls
    #print(freq3)
    dsim[i,j] <- freq3
  }

}

#Plot the outcomes:
plot(rep(1,num.trials), dsim[1,], xlim=c(1,n), ylim=c(0,1), pch=16, col="blue", xlab="Number of Rolls", ylab="Frequency")
for(i in 2:n){
  points(rep(i,num.trials), dsim[i,], pch=16, col="blue")
}
abline(a = 1/6, b = 0) # 1/6 is the theoretical probability of obtaining a 3 on a roll.


