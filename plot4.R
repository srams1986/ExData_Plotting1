x <- read.table('household_power_consumption.txt', sep = ';', 
                header = TRUE, na.strings = '?')
x$datetime <- as.POSIXlt(strptime(paste(x$Date, ' ', x$Time),format="%d/%m/%Y %H:%M:%S"))
xsub <- subset(x, x$datetime >= '2007-02-01 00:00:00' & x$datetime < '2007-02-03 00:00:00')

png(filename='plot4.png', width=480, height=480, units='px')

par(mfrow=c(2,2))

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))

plot(xsub$datetime,
     xsub$Global_active_power,     xlim=c(startDay, endDay),
     xaxt="n",     type="l",
     xlab="",     ylab="Global Active Power"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

plot(xsub$datetime,     xsub$Voltage,
     xlim=c(startDay, endDay),
     xaxt="n",     type="l",
     xlab="datetime",     ylab="Voltage"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

plot(xsub$datetime,
     xsub$Sub_metering_1,     xlim=c(startDay, endDay),
     xaxt="n",     type="l",     xlab="",
     ylab="Energy sub metering"
)

lines(xsub$datetime, xsub$Sub_metering_2, col="red")
lines(xsub$datetime, xsub$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

plot(xsub$datetime,
     xsub$Global_reactive_power,
     xlim=c(startDay, endDay),     xaxt="n",
     type="l",     xlab="datetime",
     ylab="Global_reactive_power"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

dev.off()