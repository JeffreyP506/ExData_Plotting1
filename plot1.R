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
png("plot1.png")
hist(hpc$Global_active_power, ylab="Frequency", xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
