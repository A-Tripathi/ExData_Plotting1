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

with(subDF, { 
plot(Sub_metering_1~Datetime, type="l", ylab="Energy Submetering", xlab="")
lines(Sub_metering_2~Datetime, type="l", col="red")
lines(Sub_metering_3~Datetime, type="l", col="blue")

})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


## Save to file in png format

dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()	