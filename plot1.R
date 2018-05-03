Sys.setlocale("LC_TIME", "English")
Alldata = read.table("household_power_consumption.txt", sep=";",header = TRUE) 
Twodaysdata<-subset(Alldata, Date %in% c("1/2/2007","2/2/2007"))

#install the library if it is not done before
install.packages("varhandle") 
library("varhandle")
power<- unfactor(Twodaysdata$Global_active_power)
voltage<-unfactor(Twodaysdata$Voltage)
reactive_power<-unfactor(Twodaysdata$Global_reactive_power)

#plot the histogram on the screen
hist(power, main = "Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency", col = "red")

#save it to the file 
png(filename="plot1.png",width = 480, height = 480)
hist(power, main = "Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency", col = "red")
dev.off()