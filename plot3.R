png(filename="plot3.png", width=480, height=480)

power <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))

x <- paste(power$Date,power$Time)
power$DateTime <- strptime(x, format="%d/%m/%Y %H:%M:%S")

power_sub <- subset(power, power$DateTime >= "2007-02-01 00:00:00" & power$DateTime <= "2007-02-02 23:59:59")

with(power_sub, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="s"))
with(power_sub, lines(DateTime, Sub_metering_2, col="red"))
with(power_sub, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()