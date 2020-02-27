library(data.table)

dt<-data.table::fread(input="household_power_consumption.txt", na.strings="?")
dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
dt<-dt[(Date >= "2007-02-01")&(Date <= "2007-02-03")]

png("plot1.png", width=480, height=480)


hist(dt$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="red")

dev.off()
