
powcons <- read.table("household_power_consumption.txt", sep = ";", dec = '.', header = TRUE, na.strings = "?")

SubsetHouseholdPow <- subset(powcons,powcons$Date == c("1/2/2007","2/2/2007") )
SubsetHouseholdPow["DateTimeVar"] <- as.POSIXct(strptime(paste(SubsetHouseholdPow$Date, SubsetHouseholdPow$Time,sep = " "),"%d/%m/%Y %H:%M:%S"))


########################cREATING TIME SERIES PLOT################
plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Global_active_power
     , type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Global_active_power
     , type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off() 

