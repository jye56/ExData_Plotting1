plot3<-function(){

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

#plot the figure on windows()
plot(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_1"])), xlab = "", ylab="Energy sub metering", type="n")
lines(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_1"])), col="black")
lines(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_2"])), col="red")
lines(datetimepower[,1],as.numeric(as.character(datetimepower[,"Sub_metering_3"])), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2",legend="Sub_metering_3"), lwd = 1, col=c("black","red","blue"))


#copy plot1 to PNG file and then close the file device 
dev.copy(png, file="plot3.png")
dev.off()

}