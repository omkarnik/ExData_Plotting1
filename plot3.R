##hpc is household power consumption
hpcdata <- "household_power_consumption.txt" 
hpc <- read.table(hpcdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subsethpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,] 

dt <- strptime(paste(subsethpc$Date, subsethpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subsethpc$Global_active_power) 
sub_Metering_1 <- as.numeric(subsethpc$Sub_metering_1)
sub_Metering_2 <- as.numeric(subsethpc$Sub_metering_2)
sub_Metering_3 <- as.numeric(subsethpc$Sub_metering_3)
png("plot3.png", width=480, height=480) 
plot(dt, sub_Metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dt, sub_Metering_2, type="l", col="red")
lines(dt, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()