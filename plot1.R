##hpc is household power consumption
hpcdata <- "household_power_consumption.txt" 
hpc <- read.table(hpcdata, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subsethpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,] 
  

GlobalActivePower <- as.numeric(subsethpc$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 