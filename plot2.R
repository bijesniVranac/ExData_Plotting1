library(data.table)

dt<-data.table::fread(input="household_power_consumption.txt", na.strings="?")
dt[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
dt <- dt[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = dt$dateTime
     , y = dt$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()