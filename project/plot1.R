
powcons <- read.table("household_power_consumption.txt", sep = ";", dec = '.', header = TRUE, na.strings = "?")

SubsetHouseholdPow <- subset(powcons,powcons$Date == c("1/2/2007","2/2/2007") )
SubsetHouseholdPow["DateTimeVar"] <- as.POSIXct(strptime(paste(SubsetHouseholdPow$Date, SubsetHouseholdPow$Time,sep = " "),"%d/%m/%Y %H:%M:%S"))

########################CREATING HISTOGRAM########################
hist(SubsetHouseholdPow$Global_active_power,
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(SubsetHouseholdPow$Global_active_power,
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() 
