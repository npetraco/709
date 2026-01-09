install.packages("remotes")
library(remotes)

install_github("npetraco/frequtils")
library(frequtils)
data(linton) # Load some built in data as a test
head(linton)

# Optional packages:
#install.packages("rgl")
#install.packages("extraDistr")
#install.packages("tolerance")
#install.packages("mlbench")
#install.packages("dafs")
#install.packages("outliers")
#install.packages("EnvStats")
#install.packages("dixonTest")
#install.packages("effectsize")
