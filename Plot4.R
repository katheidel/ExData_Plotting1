# Plot4.R
# Creates plot4.png

setwd("~/Desktop/coursera/exploratory data analysis")

# Read in the data
hpc <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",skip=66637,nrows=2880,col.names=
  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
  "Sub_metering_2","Sub_metering_3"))

# Create date/time column
hpc$combinedtime <- paste(hpc$Date, hpc$Time)
hpc$newtime <- strptime(hpc$combinedtime, "%d/%m/%Y %H:%M:%S")

# Create Plot 4
par(mfrow = c(2,2))
plot(hpc$newtime,hpc$Global_active_power,type="l",ylab = "Global Active Power",xlab=NA)
plot(hpc$newtime,hpc$Voltage,type="l",ylab = "Voltage",xlab="datetime")
plot(hpc$newtime,hpc$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab=NA)
lines(hpc$newtime,hpc$Sub_metering_2,col="red")
lines(hpc$newtime,hpc$Sub_metering_3,col="blue")
legend("topright",lwd=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),cex=0.7)
plot(hpc$newtime,hpc$Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()

