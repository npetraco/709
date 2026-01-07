# Load data:
dat <- read.csv("https://raw.githubusercontent.com/npetraco/709/refs/heads/main/R/data/Glass.csv")

head(dat)

# Scatter plot:
plot(dat[,1], dat[,2])


# Histogram:
hist(dat[,1])


# Box and whisker plot:
boxplot(dat[,1], horizontal = T)

  