library(data.table)

##read txt data##
rawdata<-read.table("household_power_consumption.txt",sep=";",header=T)

##select data for "2007-02-01" and "2007-02-02" two days only##
data<-rawdata[rawdata$Date=="1/2/2007"|rawdata$Date=="2/2/2007",]
str(data)

##Convert Date and Time to Date/Time##

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


## Convert Factor type to Numeric type ##
data$Global_active_power<-as.numeric(as.character(data[,"Global_active_power"]))
data$Global_reactive_power<-as.numeric(as.character(data[,"Global_reactive_power"]))
data$Voltage<-as.numeric(as.character(data[,"Voltage"]))
data$Global_intensity<-as.numeric(as.character(data[,"Global_intensity"]))
data$Sub_metering_1<-as.numeric(as.character(data[,"Sub_metering_1"]))
data$Sub_metering_2<-as.numeric(as.character(data[,"Sub_metering_2"]))

str(data)
summary(data)

##plot1##
with(data, hist(Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",cex.axis=0.8,col="red"))
par(opar)

##copy to PNG file##
dev.copy(png,file="plot1.png")
dev.off()