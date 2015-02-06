## Read in the Data File

DF <- read.table("household_power_consumption.txt", header=T, sep=';', dec=".", stringsAsFactors=F, na.strings="?", nrows=2075259, comment.char="")

## Convert the Date

DF$Date <- as.Date(DF$Date, format="%d/%m/%Y")

## Subset the Data File DF

subDF <- subset(DF, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DF)

## Plot the data

globalActivePower <- as.numeric(subDF$Global_active_power)
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## Save to file in png format

dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()	