plot1<-function(){

library(dplyr)

# read file into memory and filter out the rows containing two dates of interest
file<-"./exdata-data-household_power_consumption/household_power_consumption.txt"
power<-read.table(file,header=T,sep=";")
subpower<-filter(power, Date=="1/2/2007"|Date=="2/2/2007")

# convert the factor Date to Date, not needed for plot1
date<-strptime(subpower[,1], "%d/%m/%Y")
nodatepower<-select(subpower,-Date)
datepower<-cbind(date,nodatepower)

#plot the figure on windows()
GlobalActivePower<-as.numeric(as.character(datepower[,3]))
hist(GlobalActivePower, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")

#copy plot1 to PNG file and then close the file device 
dev.copy(png, file="plot1.png")
dev.off()

}