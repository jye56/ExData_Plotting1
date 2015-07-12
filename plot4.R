plot4<-function(){

library(dplyr)

# read file into memory and filter out the rows containing two dates of interest
file<-"./exdata-data-household_power_consumption/household_power_consumption.txt"
power<-read.table(file,header=T,sep=";")
subpower<-filter(power, Date=="1/2/2007"|Date=="2/2/2007")

# combine data and time to create as string of datetime, then convert it
# to datetime using function strptime,replace the Date in data.fram by datetime

stringdatetime<-paste(subpower[,1],subpower[,2])
datetime<-strptime(stringdatetime, "%d/%m/%Y %H:%M:%S")
nodatepower<-select(subpower,-Date)
datetimepower<-cbind(datetime,nodatepower)

par(mfcol=c(2,2))

#plot the figure on windows()
#1
plot(datetimepower[,1],as.numeric(as.character(datetimepower[,3])), xlab = "", ylab="Global Active Power (kilowatts)", type="l")
 
#2
plot(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_1"])), xlab = "", ylab="Energy sub metering", type="n")
lines(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_1"])), col="black")
lines(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_2"])), col="red")
lines(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_3"])), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",legend="Sub_metering_3"), text.font=3, lwd = 1, col=c("black","red","blue"))

#3
plot(datetimepower[,1],as.numeric(as.character(datetimepower[,"Voltage"])), xlab = "datetime", ylab="Voltage", type="l")
 
#4
plot(datetimepower[,1],as.numeric(as.character(datetimepower[,4])), xlab = "datetime", ylab="Global_reactive_power", type="l")
 

#copy plot1 to PNG file and then close the file device 
dev.copy(png, file="plot4.png")
dev.off()

}