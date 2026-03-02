mu         <- 0
sig        <- 1
n          <- 10
conf       <- 0.80
num.trials <- 20000
delay      <- 0.085

alp <- 1-conf
tc  <- qt(1-alp/2, df = n-1)
ciQs <- array(NA, num.trials)

# This is the sampling distribution for mu used in the plots below:
xx <- seq(from=-3.5/sqrt(n), to=3.5/sqrt(n), length.out=1000)
yy <- dnorm(xx, mean = 0, sd = 1/sqrt(n))
par(mfrow = c(1, 2)) # Split the screen to show the plots side-by-side

count <- 0
for(i in 1:num.trials){
  
  # Sample n points:
  x <- rnorm(n = n, mean = mu, sd = sig)
  
  # CI for the (true) mu:
  mu.hat <- mean(x)
  se     <- sd(x)/sqrt(n)
  mu.hi  <- mu.hat + tc*se
  mu.lo  <- mu.hat - tc*se
  
  # Check if true mu is in confidence interval:
  muinQ   <- (mu >= mu.lo & mu <= mu.hi) 
  ciQs[i] <- muinQ
  
  # Achieved prediction confidence so far (for plotting):
  ciQs.sofar    <- ciQs[1:i]
  ci.conf.sofar <- sum(ciQs.sofar)/i*100
  
  # For the first 100 samples, just run the algorithm with a delay
  # so you can see the buildup of the barplot:
  if(i <= 100){
    
    plot(xx,yy,typ="l", xlab = "mu.hat", ylab="", main="mu sampling dist.")
    if(muinQ){
      pt.cols<-c("black","green", "black")
    } else {
      pt.cols <- c("black","red", "black")
    }
    points(rbind( c(mu.lo,0), c(mu,0), c(mu.hi,0) ), pch=c(20,19,20), col=pt.cols)
    ins  <- sum(ciQs.sofar)
    outs <- (i - ins)
    barplot(c(outs/i*100, ins/i*100), names.arg = c("mu out CI", "mu in CI"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(ci.conf.sofar, 2)))
    print(paste0("Sample#: ", i, " [mu.lo=", round(mu.lo,1), ", mu.hi=", round(mu.hi,1), "], mu.true=", mu, " in?: ", muinQ))
    
    Sys.sleep(delay)
    
  } else {
    # After the first 100 samples, just re-plot the histogram 5% of 
    # the time because there are a lot of them (cf. num.sims ) and R 
    # can't re-plot so fast:
    count <- count + 1
    
    if(count == round(num.trials*0.05)){ 
      
      plot(xx,yy,typ="l", xlab = "mu.hat", ylab="", main="mu sampling dist.")
      if(muinQ){
        pt.cols<-c("black","green", "black")
      } else {
        pt.cols <- c("black","red", "black")
      }
      points(rbind( c(mu.lo,0), c(mu,0), c(mu.hi,0) ), pch=c(20,19,20), col=pt.cols)
      ins  <- sum(ciQs.sofar)
      outs <- (i - ins)
      barplot(c(outs/i*100, ins/i*100), names.arg = c("mu out CI", "mu in CI"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(ci.conf.sofar, 2)))
      print(paste0("Sample#: ", i, " [mu.lo=", round(mu.lo,1), ", mu.hi=", round(mu.hi,1), "], mu.true=", mu, " in?: ", muinQ))
      
      count <- 0
      
    }
    
  }
  
  # Finally, re-plot everything including the last samples not 
  # included in the plots above:
  if(i==num.trials){
    
    plot(xx,yy,typ="l", xlab = "mu.hat", ylab="", main="mu sampling dist.")
    if(muinQ){
      pt.cols<-c("black","green", "black")
    } else {
      pt.cols <- c("black","red", "black")
    }
    points(rbind( c(mu.lo,0), c(mu,0), c(mu.hi,0) ), pch=c(20,19,20), col=pt.cols)
    ins  <- sum(ciQs.sofar)
    outs <- (i - ins)
    barplot(c(outs/i*100, ins/i*100), names.arg = c("mu out CI", "mu in CI"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(ci.conf.sofar, 2)))
    print(paste0("Sample#: ", i, " [mu.lo=", round(mu.lo,1), ", mu.hi=", round(mu.hi,1), "], mu.true=", mu, " in?: ", muinQ))
    
    print(paste0("Achieved confidence: ", round(ci.conf.sofar, 2), "%"))
  }
  
}
dev.off()
#plot(1)