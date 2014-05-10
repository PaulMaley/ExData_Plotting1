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
plotfile <- png("plot4.png", width = 480, height = 480)

## Build Plot
## 4/ 2 x 2 plot grid
par(mfrow=c(2,2))

# Plot 1
plot(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     data$Global_active_power[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     type="l", xlab="", ylab = "Global Active Power")

# Plot 2
plot(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     data$Voltage[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     col= "black", type="l", xlab="datetime", ylab = "Voltage")

# Plot 3
plot(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     data$Sub_metering_1[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     col= "black", type="l", xlab="", ylab = "Energy sub metering")
lines(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     data$Sub_metering_2[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     col= "red", type="l")
lines(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
      data$Sub_metering_3[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
      col= "blue", type="l")
legend("topright",col=c("black","red","blue"), 
       legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1, bty="n")

# Plot 4 
plot(data$Time[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     data$Global_reactive_power[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")],
     col= "black", type="l", xlab="datetime", ylab="Global_reactive_power")

# Close graphics device
dev.off()
