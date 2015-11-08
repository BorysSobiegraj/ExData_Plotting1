
powcons <- read.table("household_power_consumption.txt", sep = ";", dec = '.', header = TRUE, na.strings = "?")

SubsetHouseholdPow <- subset(powcons,powcons$Date == c("1/2/2007","2/2/2007") )
SubsetHouseholdPow["DateTimeVar"] <- as.POSIXct(strptime(paste(SubsetHouseholdPow$Date, SubsetHouseholdPow$Time,sep = " "),"%d/%m/%Y %H:%M:%S"))


########################cREATING PLOT REFLECTING MULTIPLE DATA SERIES ################

plot(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, xlab = "", ylab = "Energy sub metering" ,type = 'n')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, type = "l")
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_2, type = "l", col = 'red')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_3, type = "l", col = 'blue')
legend("topright",lty=1 ,border = "red", 
       col = c('black',"blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, xlab = "", ylab = "Energy sub metering" ,type = 'n')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, type = "l")
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_2, type = "l", col = 'red')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_3, type = "l", col = 'blue')
legend("topright",lty=1 ,border = "red", 
       col = c('black',"blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() 

