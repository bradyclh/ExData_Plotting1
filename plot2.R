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

#create a plot
par(mfrow = c(1, 1))
with(h1, plot(DD, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#copy a plot to png device
dev.copy(png, file="plot2.png", width = 480, height = 480)

#close device
dev.off()