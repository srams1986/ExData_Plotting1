x <- read.table('household_power_consumption.txt', sep = ';', 
                header = TRUE, na.strings = '?')
x$datetime <- as.POSIXlt(strptime(paste(x$Date, ' ', x$Time),format="%d/%m/%Y %H:%M:%S"))
xsub <- subset(x, x$datetime >= '2007-02-01 00:00:00' & x$datetime < '2007-02-03 00:00:00')


png(filename='plot1.png', width=480, height=480, units='px')
hist(xsub$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()