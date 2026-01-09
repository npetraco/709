library(dafs)

data("shotgun.df")
attach(shotgun.df)

y          <- shotgun.df$sqrt.area[expt=="train"]        # responses
lbl.treat  <- as.factor(shotgun.df$range[expt=="train"]) # treatment labels
mu.treat   <- tapply(y, lbl.treat, mean)                 # treatment means, mu_i

tau.treat  <- mean(y) - tapply(y, lbl.treat, mean)       # treatment effects, tau_i
tau.treat

mu.overall <- mean(y)                                    # overall mean est
mu.overall
sum(mu.treat/nlevels(lbl.treat))                         # overall mean est too

sum(tau.treat)                                           # sum of treat. effects = 0

mean(mu.treat)
mu.overall

detach(shotgun.df)