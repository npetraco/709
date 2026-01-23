
# Standard deviation:
sd(c(7.97, 7.80, 7.79, 8.12, 8.12, 8.22, 8.03, 7.97, 7.88, 8.08))

# Median absolute deviation:
mad(c(7.97, 7.80, 7.79, 8.12, 8.12, 8.22, 8.03, 7.97, 7.88, 8.08))
?mad



# Dr. James Curran's dafs (http://www.stat.auckland.ac.nz/~curran)
library(dafs)

data(dpd.df)              # Deoxypyridinoline data

# Range:
range(dpd.df[,5])         # Look at column 5 for Deoxypyridinoline
# concentration and get its range
diff(range(dpd.df[,5]))   # Range as defined in the notes

# Box and whiskers plots:
boxplot(dpd.df[,5], horizontal = T, range = 0, xlab = "Deoxypyridinoline conc.")
summary(dpd.df[,5])       # Common summary statistics: Much in BW plot above
