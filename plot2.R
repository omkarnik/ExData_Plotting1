##hpc is household power consumption
hpcdata <- "household_power_consumption.txt" 
hpc <- read.table(hpcdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subsethpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,] 


dt <- strptime(paste(subsethpc$Date, subsethpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsethpc$Global_active_power) 
png("plot2.png", width=480, height=480) 
plot(dt, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 