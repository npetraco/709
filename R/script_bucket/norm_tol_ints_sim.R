library(tolerance)

mu         <- 0
sig        <- 1
n          <- 10
conf       <- 0.8
p          <- 0.75
num.trials <- 8000
delay      <- 0.085

alp   <- 1-conf
tolQs <- array(NA, num.trials)

# This is the data's distribution (population) used in the plots below:
xx <- seq(from=-3.5, to=3.5, length.out=1000)
yy <- dnorm(xx, mean = 0, sd = 1)
par(mfrow = c(1, 2)) # Split the screen to show the plots side-by-side

count <- 0
for(i in 1:num.trials){
  
  # Sample n points:
  x  <- rnorm(n = n, mean = mu, sd = sig)
  
  # Get tolerance interval:
  tol.info <- normtol.int(x, alpha = alp, P = p, side = 2)
  xlo      <- as.numeric(tol.info[4]) # 2-sided.lower
  xhi      <- as.numeric(tol.info[5]) # 2-sided.upper
  
  # Check tolerance intervals coverage:
  p.cover  <- pnorm(q = xhi, mean = 0, sd = 1) - pnorm(q = xlo, mean = 0, sd = 1)
  pcQ      <- p.cover >= p
  tolQs[i] <- pcQ
  
  # Achieved tolerance confidence so far (for plotting):
  tolQs.sofar    <- tolQs[1:i]
  tol.conf.sofar <- sum(tolQs.sofar)/i*100
  
  # For the first 100 samples, just run the algorithm with a delay
  # so you can see the buildup of the histogram:
  if(i <= 100){
    
    plot(xx,yy,typ="l", xlab = "x", ylab="", main="x (data) pop. dist.")
    if(pcQ){
      pt.cols<-c("green","green")
    } else {
      pt.cols <- c("red","red")
    }
    points(rbind( c(xlo,0), c(xhi,0) ), pch=c(16,16), col=pt.cols)
    ins  <- sum(tolQs.sofar)
    outs <- (i - ins)
    barplot(c(outs/i*100, ins/i*100), names.arg = c("cover < p", "cover >= p"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(tol.conf.sofar, 2)))
    print(paste0("Sample#: ", i, " [xlo=", round(xlo,1), ", xhi=", round(xhi,1), "] p.cov=", round(p.cover*100,1), "%. Cover ", p*100, "%-pop? ", pcQ))
    
    Sys.sleep(delay)
  } else {
    # After the first 100 samples, just re-plot the histogram 5% of 
    # the time because there are a lot of them (cf. num.sims ) and R 
    # can't re-plot so fast:
    count <- count + 1
    
    if(count == round(num.trials*0.05)){ 
      
      plot(xx,yy,typ="l", xlab = "x", ylab="", main="x (data) pop. dist.")
      if(pcQ){
        pt.cols<-c("green","green")
      } else {
        pt.cols <- c("red","red")
      }
      points(rbind( c(xlo,0), c(xhi,0) ), pch=c(16,16), col=pt.cols)
      ins  <- sum(tolQs.sofar)
      outs <- (i - ins)
      barplot(c(outs/i*100, ins/i*100), names.arg = c("cover < p", "cover >= p"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(tol.conf.sofar, 2)))
      print(paste0("Sample#: ", i, " [xlo=", round(xlo,1), ", xhi=", round(xhi,1), "] p.cov=", round(p.cover*100,1), "%. Cover ", p*100, "%-pop? ", pcQ))
      
      count <- 0
      
    }
    
  }
  
  if(i==num.trials){
    
    plot(xx,yy,typ="l", xlab = "x", ylab="", main="x (data) pop. dist.")
    if(pcQ){
      pt.cols<-c("green","green")
    } else {
      pt.cols <- c("red","red")
    }
    points(rbind( c(xlo,0), c(xhi,0) ), pch=c(16,16), col=pt.cols)
    ins  <- sum(tolQs.sofar)
    outs <- (i - ins)
    barplot(c(outs/i*100, ins/i*100), names.arg = c("cover < p", "cover >= p"), col=c("red","green"), ylim=c(0,100), ylab="%", main=paste0("Achieved conf.: ", round(tol.conf.sofar, 2)))
    print(paste0("Sample#: ", i, " [xlo=", round(xlo,1), ", xhi=", round(xhi,1), "] p.cov=", round(p.cover*100,1), "%. Cover ", p*100, "%-pop? ", pcQ))
    
    print(paste0("Achieved confidence: ", round(tol.conf.sofar, 2), "%"))
  }
  
}
dev.off()
#plot(1)
