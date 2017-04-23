# Plot1.R
# Creates plot1.png

setwd("~/Desktop/coursera/exploratory data analysis")

# Read in the data
hpc <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",skip=66637,nrows=2880,col.names=
  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
  "Sub_metering_2","Sub_metering_3"))

# Create date/time column
hpc$combinedtime <- paste(hpc$Date, hpc$Time)
hpc$newtime <- strptime(hpc$combinedtime, "%d/%m/%Y %H:%M:%S")

# Create plot 1
hist(hpc$Global_active_power,col = "red",breaks=12,xlab="Global active power (kilowatts)",main = "Global Active Power")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

