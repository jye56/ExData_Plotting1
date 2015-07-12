plot2<-function(){

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
plot(mp[,1],as.numeric(as.character(mp[,3])), xlab = "", ylab="Global Active Power (kilowatts)", type="l")
 
#copy plot1 to PNG file and then close the file device 
dev.copy(png, file="plot2.png")
dev.off()


}