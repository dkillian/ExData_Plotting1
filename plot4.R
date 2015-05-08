## Exploratory data analysis course project

setwd("C:/Users/Dan/Dropbox/personal/Coursera/Data science certificate/Exploratory data analysis/Course projects/ExData_Plotting1/")

## download folder then unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="household power consumption.zip")
unzip("household power consumption.zip", exdir=".")
power <- read.csv("household_power_consumption.txt", sep=";")

## data prep
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power <- subset(power, Date=="2007-2-1" | Date=="2007-2-2")

power$datetime <- paste(power$Date, power$Time)
power$datetime <- as.POSIXct(as.character(power$datetime, "%YY/%m/%d %H:%M:%S"))

power[,3] <- as.numeric(power[,3])
power[,4] <- as.numeric(power[,4])
power[,5] <- as.numeric(power[,5])
power[,6] <- as.numeric(power[,6])
power[,7] <- as.numeric(power[,7])
power[,8] <- as.numeric(power[,8])
power[,9] <- as.numeric(power[,9])

describe(power)
summary(power)
str(power)

?weekdays
power$day <- weekdays(power$datetime)

## Plot 4

par(mfrow=c(2,2))

plot(power$datetime,power$Global_active_power,xlab="", ylab="Global Active Power", type="l")

plot(power$datetime, power$Voltage, type="l", xlab="", ylab="Voltage")

plot(power$datetime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")

lines(power$datetime, power$Sub_metering_2, type="l", xlab="", col="blue")

lines(power$datetime, power$Sub_metering_3, type="l", xlab="", col="red")

legend("topright",lty, col=c("black","blue", "red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.5)

plot(power$datetime, power$Global_reactive_power, type="l", xlab="", ylab="Global reactive power")

dev.copy(png, "plot4.png")
dev.off()
