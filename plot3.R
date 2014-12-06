setwd("E:/Coursera/Exploratory Data Analysis")

#read file
file <- "./household_power_consumption.txt"
household_data <- read.table(file, header=TRUE, nrows=69516, sep=";", na.strings=c("?"))

#column Date is converted to "YYYY-MM-DD" from "DD/MM/YYYY"
household_data$Date <- as.Date(as.Date(household_data$Date, "%d/%m/%Y"), "%Y-%m-%d")

#filter Date from 2007-02-01 to 2007-02-02
h1 <- household_data[household_data$Date >= "2007-02-01",]

#add new column DD (Date + Time)
par(mfrow = c(1, 1))
h1$DD <-strptime(paste(h1$Date, h1$Time), "%Y-%m-%d %H:%M:%S")

#create a plot
with(h1, plot(DD, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering"))
with(h1, points(DD, Sub_metering_2, type="l", col="red", xlab="", ylab="Energy Sub Metering"))
with(h1, points(DD, Sub_metering_3, type="l", col="blue", xlab="", ylab="Energy Sub Metering"))
legend("topright", lty=c(1,1,1), cex=0.75,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copy a plot to png device
dev.copy(png, file="plot3.png", width = 480, height = 480)

#close device
dev.off()