#load the file, please skip these steps if file is loaded
Sys.setlocale("LC_TIME", "English")
Alldata = read.table("household_power_consumption.txt", sep=";",header = TRUE) 
Twodaysdata<-subset(Alldata, Date %in% c("1/2/2007","2/2/2007"))

#install the library if it is not done before
install.packages("varhandle") 
library("varhandle")
power<- unfactor(Twodaysdata$Global_active_power)
voltage<-unfactor(Twodaysdata$Voltage)
reactive_power<-unfactor(Twodaysdata$Global_reactive_power)



Date<-strptime(Twodaysdata$Date,"%d/%m/%Y")
Twodaysdata$DateTime<-paste(Date,Twodaysdata$Time)
Twodaysdata$DateTime<-strptime(Twodaysdata$DateTime, "%Y-%m-%d %H:%M:%S")
plot(Twodaysdata$DateTime, power, type='l', xlab="", ylab = "Global Active Power (kilowatts)")

#save the second png to the file
png(filename="plot2.png",width = 480, height = 480)
plot(Twodaysdata$DateTime, power, type='l', xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
