mu         <- 0
sig        <- 1
n          <- 10
conf       <- 0.8
num.trials <- 20000
delay      <- 0.085

alp <- 1-conf
tp  <- qt(1-alp/2, df = n-1)
predQs <- array(NA, num.trials)

# This is the data's distribution (population) used in the plots below:
xx <- seq(from=-3.5, to=3.5, length.out=1000)
yy <- dnorm(xx, mean = 0, sd = 1)
par(mfrow = c(1, 2)) # Split the screen to show the plots side-by-side

count <- 0
for(i in 1:num.trials){
  
  # Sample n points:
  x  <- rnorm(n = n, mean = mu, sd = sig)
  xb <- mean(x)
  s  <- sd(x)
  
  # Prediction interval for the n+1^th point:
  xhi <- xb + tp*s*(sqrt(1+(1/n)))
  xlo <- xb - tp*s*(sqrt(1+(1/n)))
  
  # Get n+1 point:
  xp <- rnorm(n = 1, mean = mu, sd = sig)
  
  # Check if n+1 point is in prediction interval:
  xinQ      <- (xp >= xlo & xp <= xhi) 
  predQs[i] <- xinQ
  
  # Achieved prediction confidence so far (for plotting):
  predQs.sofar    <- predQs[1:i]
  pred.conf.sofar <- sum(predQs.sofar)/i*100
  
  # For the first 100 sims, just run the algorithm with a delay
  # so you can see the buildup of the barplot:
  if(i <= 100){
    
    plot(xx,yy,typ="l", xlab = "x", ylab="", main="x (data) pop. dist.")
    if(xinQ){
      pt.cols<-c("black","green", "black")
    } else {
      pt.cols <- c("black","red", "black")
    }
    points(rbind( c(xlo,0), c(xp,0), c(xhi,0) ), pch=c(20,19,20), col=pt.cols)
    ins  <- sum(predQs.sofar)
    outs <- (i - ins)
    barplot(c(outs/i*100, ins/i*100), names.arg = c("xp out PI", "xp in PI"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(pred.conf.sofar, 2)))
    print(paste0("Sample#: ", i, " [xlo=", round(xlo,1), ", xhi=", round(xhi,1), "], xn+1=", round(xp,2), " in?: ", xinQ))

    Sys.sleep(delay)
  } else {
    # After the first 100 samples, just re-plot the histogram 5% of 
    # the time because there are a lot of them (cf. num.sims ) and R 
    # can't re-plot so fast:
    count <- count + 1
    
    if(count == round(num.trials*0.05)){ 
      
      plot(xx,yy,typ="l", xlab = "x", ylab="", main="x (data) pop. dist.")
      if(xinQ){
        pt.cols<-c("black","green", "black")
      } else {
        pt.cols <- c("black","red", "black")
      }
      points(rbind( c(xlo,0), c(xp,0), c(xhi,0) ), pch=c(20,19,20), col=pt.cols)
      ins  <- sum(predQs.sofar)
      outs <- (i - ins)
      barplot(c(outs/i*100, ins/i*100), names.arg = c("xp out PI", "xp in PI"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(pred.conf.sofar, 2)))
      print(paste0("Sample#: ", i, " [xlo=", round(xlo,1), ", xhi=", round(xhi,1), "], xn+1=", round(xp,2), " in?: ", xinQ))
      
      count <- 0
      
    }
    
  }
  
  if(i==num.trials){
    
    plot(xx,yy,typ="l", xlab = "x", ylab="", main="x (data) pop. dist.")
    if(xinQ){
      pt.cols<-c("black","green", "black")
    } else {
      pt.cols <- c("black","red", "black")
    }
    points(rbind( c(xlo,0), c(xp,0), c(xhi,0) ), pch=c(20,19,20), col=pt.cols)
    ins  <- sum(predQs.sofar)
    outs <- (i - ins)
    barplot(c(outs/i*100, ins/i*100), names.arg = c("xp out PI", "xp in PI"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(pred.conf.sofar, 2)))
    print(paste0("Sample#: ", i, " [xlo=", round(xlo,1), ", xhi=", round(xhi,1), "], xn+1=", round(xp,2), " in?: ", xinQ))
    
    print(paste0("Achieved confidence: ", round(pred.conf.sofar, 2), "%"))
  }
  
}
dev.off()
#plot(1)
