library(data.table)

dat <- read.csv("/Users/karen2/latex/class/fos705/Applied_Freq/R/data/elaan_data/uv_quant_elaan.csv")

attach(dat)
dat2 <- dat[metal=="Co" & wavelength==411 & type=="known", c(5,6)]
dat2 <- dat2[-(1:3), ]
dat2$absorbance <- as.numeric(dat2$absorbance)
plot(dat2$concentration, dat2$absorbance)

y1 <- dat2$absorbance
x1 <- dat2$concentration

y2 <- rowMeans(t(matrix(dat2$absorbance, nrow = 3)))
x2 <- rowMeans(t(matrix(dat2$concentration, nrow = 3)))

fit1 <- lm(y1 ~ x1) # Basic linear regression
abline(fit1)        # Show best fit line
summary(fit1)       # Shows regression coefs and some diagnostics
anova(fit1)         # Regression ANOVA table. "Total" row is absent

fit2 <- lm(y2 ~ x2) # Basic linear regression
abline(fit2)        # Show best fit line
summary(fit2)       # Shows regression coefs and some diagnostics
anova(fit2)         # Regression ANOVA table. "Total" row is absent


# Simulate some data
b0 <- 0.0
b1 <- 0.3
#sig.eps <- 0.0007868
#sig.eps <- 0.001
sig.eps <- 0.003

conc <- seq(from=0, to=0.5, length.out=11)
#conc <- round(conc, 2)
abs1 <- round(b0 + b1*conc + rnorm(length(conc), mean = 0, sd = sig.eps), 3)
abs2 <- round(b0 + b1*conc + rnorm(length(conc), mean = 0, sd = sig.eps), 3)
abs3 <- round(b0 + b1*conc + rnorm(length(conc), mean = 0, sd = sig.eps), 3)
dat.new <- cbind(c(conc, conc, conc), c(abs1, abs2, abs3))
plot(dat.new[,1], dat.new[,2])

concs    <- c(conc, conc, conc)
ord.idxs <- order(concs)
concs    <- concs[ord.idxs]

abss <- c(abs1, abs2, abs3)
abss <- abs(abss[ord.idxs])
dat.new2 <- cbind(concs, abss)
dat.new2[,2]

0.05, 0.05, 0.05, 
0.10, 0.10, 0.10,
0.15, 0.15, 0.15, 
0.20, 0.20, 0.20, 
0.25, 0.25, 0.25, 
0.30, 0.30, 0.30, 
0.35, 0.35, 0.35, 
0.40, 0.40, 0.40, 
0.45, 0.45, 0.45, 
0.50, 0.50, 0.50

0.014, 0.012, 0.013, 
0.030, 0.030, 0.035, 
0.045, 0.041, 0.046, 
0.063, 0.065, 0.059, 
0.078, 0.075, 0.080, 
0.092, 0.092, 0.089, 
0.107, 0.106, 0.108, 
0.122, 0.121, 0.119, 
0.132, 0.132, 0.137, 
0.155, 0.148, 0.147
