library(data.table)
setwd('~/class/exdata-002/ExData_Plotting1/')
myFile = './../household_power_consumption.txt'
hpc <- read.table(myFile,
                  skip = 66637,
                  nrows = 2880,
                  col.names = colnames(read.table(myFile, nrow = 1, header = TRUE, sep=";")),
                  header=TRUE,
                  sep = ";",
                  na.strings = "?")
hpc$myDate <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow = c(2,2))
plot(hpc$myDate, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(hpc$myDate, hpc$Voltage, type="l", xlab = "datetime", ylab="Voltage")
plot(c(hpc$myDate,hpc$myDate,hpc$myDate), c(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3), type="l", xlab="", ylab="Energy sub metering")
with(hpc, lines(myDate, Sub_metering_2, col="red"))
with(hpc, lines(myDate, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc$myDate, hpc$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
