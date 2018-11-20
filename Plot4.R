## Creates Plot 4

## read table txt. Fix the Var names (not separated by commas)
hh <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(hh) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## subset the dates
hh4 <- subset(hh,hh$Date == "1/2/2007"|hh$Date == "2/2/2007")

## fix the Vars to numeric
hh4$Global_active_power <- as.numeric(as.character(hh4$Global_active_power))
hh4$Voltage <- as.numeric(as.character(hh4$Voltage))
hh4$Sub_metering_1 <- as.numeric(as.character(hh4$Sub_metering_1))
hh4$Sub_metering_2 <- as.numeric(as.character(hh4$Sub_metering_2))
hh4$Sub_metering_3 <- as.numeric(as.character(hh4$Sub_metering_3))
hh4$Global_reactive_power <- as.numeric(as.character(hh4$Global_reactive_power))

## Builds a date - time var
hh4$Date <- as.Date(hh4$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(hh4$Date),hh4$Time)
hh4$Datetime <- as.POSIXct(datetime)

## Draws the 4 plots
par(mfrow=c(2,2))
plot(hh4$Global_active_power~hh4$Datetime,type="l",ylab="Global Active Power",xlab="")
plot(hh4$Voltage~hh4$Datetime,type="l",ylab="Voltage",xlab="datetime")
plot(hh4$Sub_metering_1~hh4$Datetime,type="l",ylab= "Energy Sub Metering",xlab="")
lines(hh4$Sub_metering_2~hh4$Datetime,col="Red")
lines(hh4$Sub_metering_3~hh4$Datetime,col="Blue")
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),cex=0.6)
plot(hh4$Global_reactive_power~hh4$Datetime,type="l",ylab="Global_Reactive_Power",xlab="datetime")

## Exports the plots
dev.copy(png,file = "Plot4.png",height=480,width=480)
dev.off()