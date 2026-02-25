mu         <- 0
sig        <- 1
n          <- 10
conf       <- 0.8
num.trials <- 20000
delay      <- 0.085

alp <- 1-conf
tp  <- qt(1-alp/2, df = n-1)
predQs <- array(NA, num.trials)

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
  #print(paste0("x_n+1 in?: ", xinQ))
  
  # Achieved prediction confidence so far (for plotting):
  predQs.sofar <- predQs[1:i]
  pred.conf.sofar <- sum(predQs.sofar)/i*100
  
  # For the first 100 sims, just run the algorithm with a delay
  # so you can see the buildup of the histogram:
  if(i <= 100){
    hist(as.numeric(predQs.sofar), breaks=2, probability = T, col=c("red","green"), main=paste0("Achieved conf.: ", round(pred.conf.sofar, 2), "%"))
    Sys.sleep(delay)
  } else {
    # After the first 100 sims, just re-plot the histogram 5% of the time becasue R can't
    # re-plot them so fast and there are num.sims (a lot) of sims:
    count <- count + 1
    
    if(count == round(num.trials*0.05)){ 
      
      # Achieved prediction confidence so far:
      predQs.sofar <- predQs[1:i]
      pred.conf.sofar <- sum(predQs.sofar)/i*100
      
      hist(as.numeric(predQs.sofar), breaks=2, probability = T, col=c("red","green"), main=paste0("Achieved conf.: ", round(pred.conf.sofar, 2)))
      count <- 0
      
    }
    
  }

}

