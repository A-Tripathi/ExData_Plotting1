## Read in the Data File

DF <- read.table("household_power_consumption.txt", header=T, sep=';', dec=".", stringsAsFactors=F, na.strings="?", nrows=2075259, comment.char="")

## Convert the Date

DF$Date <- as.Date(DF$Date, format="%d/%m/%Y")

## Subset the Data File DF

subDF <- subset(DF, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DF)

## Converting datetime

datetime <- paste(as.Date(subDF$Date), subDF$Time)
subDF$Datetime <- as.POSIXct(datetime)

## Plot the data 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subDF, { 
plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="datetime")
plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime, type="l", col="Red")
lines(Sub_metering_3~Datetime, type="l", col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~Datetime, type="l", ylab="Global Reactive Power (kilowatts)", xlab="datetime")

})


## Save to file in png format

dev.copy(png, file="plot4.png", height = 480, width = 480)
dev.off()	