#please skip these steps if the file is already loaded
Sys.setlocale("LC_TIME", "English")
Alldata = read.table("household_power_consumption.txt", sep=";",header = TRUE) 
Twodaysdata<-subset(Alldata, Date %in% c("1/2/2007","2/2/2007"))

#install the library if it is not done before
install.packages("varhandle") 
library("varhandle")
power<- unfactor(Twodaysdata$Global_active_power)
voltage<-unfactor(Twodaysdata$Voltage)
reactive_power<-unfactor(Twodaysdata$Global_reactive_power)

plot(Twodaysdata$DateTime, Twodaysdata$Sub_metering_1, type='l')
lines(Twodaysdata$DateTime, unfactor(Twodaysdata$Sub_metering_2), type='l',col='red')
lines(Twodaysdata$DateTime, Twodaysdata$Sub_metering_3, type='l',col='blue')
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("Black","red", "blue"),lty=1.2,cex=1)

#save the image to file
png(filename="plot3.png",width = 480, height = 480)
plot(Twodaysdata$DateTime, Twodaysdata$Sub_metering_1, type='l')
lines(Twodaysdata$DateTime, unfactor(Twodaysdata$Sub_metering_2), type='l',col='red')
lines(Twodaysdata$DateTime, Twodaysdata$Sub_metering_3, type='l',col='blue')
legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("Black","red", "blue"),lty=1.2,cex=1)
dev.off()
