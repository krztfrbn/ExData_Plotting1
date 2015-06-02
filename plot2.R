png(filename="plot2.png", width=480, height=480)

power <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

x <- paste(power$Date,power$Time)
power$DateTime <- strptime(x, format="%d/%m/%Y %H:%M:%S")

power_sub <- subset(power, power$DateTime >= "2007-02-01 00:00:00" & power$DateTime <= "2007-02-02 23:59:59")

with(power_sub, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="s"))

dev.off()