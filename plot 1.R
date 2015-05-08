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

library(psych)
describe(power)
summary(power)
str(power)

## Plot 1

hist(power$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

dev.copy(png, "plot1.png") 
## default setting for png is 480 x 480
dev.off()