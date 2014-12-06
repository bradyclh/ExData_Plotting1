setwd("E:/Coursera/Exploratory Data Analysis")

#read file
file <- "./household_power_consumption.txt"
household_data <- read.table(file, header=TRUE, nrows=69516, sep=";", na.strings=c("?"))

#column Date is converted to "YYYY-MM-DD" from "DD/MM/YYYY"
household_data$Date <- as.Date(as.Date(household_data$Date, "%d/%m/%Y"), "%Y-%m-%d")

#filter Date from 2007-02-01 to 2007-02-02
h1 <- household_data[household_data$Date >= "2007-02-01",]

#add new column DD (Date + Time)
h1$DD <-strptime(paste(h1$Date, h1$Time), "%Y-%m-%d %H:%M:%S")

#create four plot
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#plot 1
#hist(h1$Global_active_power, col="red", xlab="")
with(h1, plot(DD, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#plot 2
with(h1, plot(DD, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#plot 3
with(h1, plot(DD, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering"))
with(h1, points(DD, Sub_metering_2, type="l", col="red", xlab="", ylab="Energy Sub Metering"))
with(h1, points(DD, Sub_metering_3, type="l", col="blue", xlab="", ylab="Energy Sub Metering"))
legend("topright", bty="n", cex=0.6, lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
with(h1, plot(DD, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

#copy a plot to png device
dev.copy(png, file="plot4.png", width = 480, height = 480)

#close device
dev.off()