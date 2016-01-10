
powcons <- read.table("household_power_consumption.txt", sep = ";", dec = '.', header = TRUE, na.strings = "?")

#install.packages('sqldf')
library(sqldf)

SubsetHouseholdPow <- sqldf("select * from powcons where Date in ('1/2/2007','2/2/2007')")
SubsetHouseholdPow["DateTimeVar"] <- as.POSIXct(strptime(paste(SubsetHouseholdPow$Date, SubsetHouseholdPow$Time,sep = " "),"%d/%m/%Y %H:%M:%S"))

########################cREATING MULTI PLOT PLOT ################

par(mfrow = c(2, 2),mar = c(4, 4, 3, 1), oma = c(0, 0, 2, 0),cex.lab = 0.8)

plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Global_active_power
     , type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")

plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Voltage
     , type = "l",xlab = "datetime", ylab = "Voltage")

plot(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, xlab = "", ylab = "Energy sub metering" ,type = 'n')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, type = "l")
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_2, type = "l", col = 'red')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_3, type = "l", col = 'blue')
legend("topright",lty=1 ,border = "red", bty =  "n",
       col = c('black',"blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Global_reactive_power
     , type = "l",xlab = "datetime" , ylab = "Global_reactive_power")




png(file = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2),mar = c(4, 4, 3, 1), oma = c(0, 0, 2, 0),cex.lab = 1)

plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Global_active_power
     , type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")

plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Voltage
     , type = "l",xlab = "datetime", ylab = "Voltage")

plot(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, xlab = "", ylab = "Energy sub metering" ,type = 'n')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_1, type = "l")
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_2, type = "l", col = 'red')
points(SubsetHouseholdPow$DateTimeVar, SubsetHouseholdPow$Sub_metering_3, type = "l", col = 'blue')
legend("topright",lty=1 ,border = "red", bty =  "n",
       col = c('black',"blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(SubsetHouseholdPow$DateTimeVar,SubsetHouseholdPow$Global_reactive_power
     , type = "l",xlab = "datetime" , ylab = "Global_reactive_power")

dev.off() 


?text
