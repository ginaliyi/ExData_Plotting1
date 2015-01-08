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

##plot3##
Sys.setlocale(category = "LC_TIME", locale = "C")


plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab= "")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",pch="__",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)

par(opar)

##copy to PNG file##
dev.copy(png,file="plot3.png")
dev.off()