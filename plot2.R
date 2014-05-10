##
## Exploratory data analysis - Assignment 1
##

## Get data file - if it doesn't exist locally download it
filename <- "./household_power_consumption.txt"

if( !file.exists(filename) ) {
  stop("File not found")
#  download.file(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip,
#               "tmp.zip", "curl")
#  Unzip ..? 
}

## Read data
data <- read.table(filename, sep=";", header=TRUE, na.strings="?")

## Convert data column to Date class and time to Date-time
data$Time <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# Open png graphics device
plotfile <- png("plot2.png", width = 480, height = 480)

## Build Plot
## 2/ Time Series of global active power
plot(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     data$Global_active_power[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     type="l", xlab="", ylab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()
