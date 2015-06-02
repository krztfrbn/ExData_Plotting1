png(filename="plot1.png", width=480, height=480)

power <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

x <- paste(power$Date,power$Time)
power$DateTime <- strptime(x, format="%d/%m/%Y %H:%M:%S")

power_sub <- subset(power, power$DateTime >= "2007-02-01 00:00:00" & power$DateTime <= "2007-02-02 23:59:59")

hist(power_sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", xlim=range(0,6))

dev.off()
