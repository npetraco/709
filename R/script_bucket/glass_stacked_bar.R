library(mlbench) 

# Load some sample data
data("Glass") 
ele.cont <- Glass[,2:9]
ele.nme  <- colnames(Glass)[2:9]
id.num   <- Glass$Type

# Translate id.nums to names with dictionary trick:
dict <- c("1"="bldg.flot", "2"="bldg.nflot", "3"="veh.flot", "5"="contnr", "6"="tabwre", "7"="headlgt")
id.nme <- as.vector(dict[as.character(id.num)])

Glass2 <- data.frame(ele.cont, id.nme, id.num)

mns <- aggregate(cbind(Glass2$Na, 
                       Glass2$Mg, 
                       Glass2$Al, 
                       Glass2$Si, 
                       Glass2$K, 
                       Glass2$Ca, 
                       Glass2$Ba,
                       Glass2$Fe) ~ Glass2$id.nme, mean,data = Glass2)
colnames(mns) <- c("type", ele.nme)
mns

barplot(cbind(mns$Na,
              mns$Mg, 
              mns$Al, 
              mns$Si, 
              mns$K, 
              mns$Ca, 
              mns$Ba, 
              mns$Fe) ~ mns$type, main="Na,Mg,Al,Si,K,Ca,Ba,Fe-content", col=rainbow(8))
legend("topright", legend = ele.nme, fill = rainbow(8), cex=0.5)


mns2 <- data.frame(ele.nme, t(mns[,2:9]))
colnames(mns2) <- c("ele.nme", unique(id.nme))
mns2

barplot(cbind(mns2$bldg.flot,
              mns2$bldg.nflot, 
              mns2$veh.flot, 
              mns2$contnr, 
              mns2$tabwre, 
              mns2$headlgt) ~ mns2$ele.nme, main="bldg.flot, bldg.nflot, veh.flot, contnr, tabwre, headlgt", col=rainbow(6))
legend("topright", legend = unique(id.nme), fill = rainbow(6), cex=0.75)
 
