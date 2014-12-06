setwd("E:/Coursera/Exploratory Data Analysis")

#read file
file <- "./household_power_consumption.txt"
household_data <- read.table(file, header=TRUE, nrows=69516, sep=";", na.strings=c("?"))

#column Date is converted to "YYYY-MM-DD" from "DD/MM/YYYY"
household_data$Date <- as.Date(as.Date(household_data$Date, "%d/%m/%Y"), "%Y-%m-%d")

#filter Date from 2007-02-01 to 2007-02-02
h1 <- household_data[household_data$Date >= "2007-02-01",]

#create a plot
par(mfrow = c(1, 1))
hist(h1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#copy a plot to png device
dev.copy(png, file="plot1.png", width = 480, height = 480)

#close device
dev.off()