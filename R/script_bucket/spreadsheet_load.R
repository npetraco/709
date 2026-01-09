# A file on the internet. Use it’s URL to load: 

dat <- read.csv("https://raw.githubusercontent.com/npetraco/709/refs/heads/main/R/data/ASCLAD_GaugeR%26R_example_data.csv", header = F)

# **check the datatype R thinks it loaded
class(dat)



# Load the spreadsheet:
dat <- read.csv("/Users/karen2/Downloads/GC_gasoline_peak_data.csv")

# Extract column 1
x <- dat[,1]

# Extract column 2
y <- dat[,2]

# Plot the data:
plot(x,y)



# file.choose lets you navigate to file you want and gets 
# its path:
apath <- file.choose()

some.data <- read.csv(apath)
some.data
