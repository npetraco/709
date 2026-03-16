library(tolerance)

# One-sided lower limit tolerance:
conf  <- 0.95
p     <- 0.70
alpha <- 1-conf

num.packs          <- 9
num.pills.per.pack <- 10
num.pos            <- 73

bintol.int(x = num.pos, n = num.packs*num.pills.per.pack, m = num.pills.per.pack, alpha = conf, P = p, side = 1)


# Follow up:
num.pills.tested   <- 90
num.pos            <- 73

bintol.int(x = 73, n = 90, m = 2000-90, alpha = conf, P = p, side = 2)
