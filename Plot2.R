## Creates Plot 2

## read table txt. Fix the Var names (not separated by commas)
hh <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(hh) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## subset the dates
hh2 <- subset(hh,hh$Date == "1/2/2007"|hh$Date == "2/2/2007")

## fix the global_Active_power to numeric
hh2$Global_active_power <- as.numeric(as.character(hh3$Global_active_power))

## Builds a date - time var
hh2$Date <- as.Date(hh2$Date,format = "%d/%m/%Y")
datetime <- paste(as.Date(hh2$Date),hh2$Time)
hh2$Datetime <- as.POSIXct(datetime)

## Draws the plot
plot(hh2$Global_active_power~hh2$Datetime,type="l",ylab = "Global Active Power (kilowatts)",xlab= "")

## Exports the plot
dev.copy(png,file = "Plot2.png",height=480,width=480)
dev.off()