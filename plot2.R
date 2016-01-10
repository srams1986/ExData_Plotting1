x <- read.table('household_power_consumption.txt', sep = ';', 
                header = TRUE, na.strings = '?')
x$datetime <- as.POSIXlt(strptime(paste(x$Date, ' ', x$Time),format="%d/%m/%Y %H:%M:%S"))
xsub <- subset(x, x$datetime >= '2007-02-01 00:00:00' & x$datetime < '2007-02-03 00:00:00')


png(filename='plot2.png', width=480, height=480, units='px')

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))


plot(xsub$datetime,    xsub$Global_active_power,     xlim=c(startDay, endDay), xaxt="n",
     type="l",   xlab="",      ylab="Global Active Power (kilowatts)"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

dev.off()