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

globalActivePower <- as.numeric(subDF$Global_active_power)
plot(globalActivePower~subDF$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Save to file in png format

dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()	