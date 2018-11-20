## Creates Plot 3

## read table txt. Fix the Var names (not separated by commas)
hh <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(hh) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## subset the dates
hh3 <- subset(hh,hh$Date == "1/2/2007"|hh$Date == "2/2/2007")

## fix the Sub_metering_1 to numeric
hh3$Sub_metering_1 <- as.numeric(as.character(hh3$Sub_metering_1))
hh3$Sub_metering_2 <- as.numeric(as.character(hh3$Sub_metering_2))
hh3$Sub_metering_3 <- as.numeric(as.character(hh3$Sub_metering_3))

## Builds a date - time var
hh3$Date <- as.Date(hh3$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(hh3$Date),hh3$Time)
hh3$Datetime <- as.POSIXct(datetime)

plot(hh3$Sub_metering_1~hh3$Datetime,type="l",ylab= "Energy Sub Metering",xlab="")
lines(hh3$Sub_metering_2~hh3$Datetime,col="Red")
lines(hh3$Sub_metering_3~hh3$Datetime,col="Blue")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

dev.copy(png,file = "Plot3.png",height=480,width=480)
dev.off()