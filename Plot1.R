## Creates Plot 1

## read table txt. Fix the Var names (not separated by commas)
hh <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(hh) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## subset the dates
hh1 <- subset(hh,hh$Date == "1/2/2007"|hh$Date == "2/2/2007")

## fix the global_Active_power to numeric
hh1$Global_active_power <- as.numeric(as.character(hh1$Global_active_power))

## Draw Histogram
hist(hh1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Export to PNG
dev.copy(png,file = "Plot1.png",height=480,width=480)
dev.off()
