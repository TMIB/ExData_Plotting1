

##Check for installed packages. Citation for this code:
##http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
list.of.packages <- c("dplyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) {install.packages(new.packages)} 
require(dplyr)

#note that most of this code is identical between plot1.r, plot2.r, and plot3.r.
#In a real-world scenario, it would likely be best to centralize the repeated
#portions of this code and refrence it, rather than repeat it. However for
#purposes of ease of grading for this course, I am sticking with including it in
#each script.
first10rows<-read.table("household_power_consumption.txt", header=TRUE, 
                        nrows = 10, sep=";", stringsAsFactors = FALSE)
numcols<-ncol(first10rows)
classes <-sapply(first10rows, class)
power<- read.table("household_power_consumption.txt", header=FALSE, 
                   col.names = names(first10rows), colClasses=classes, 
                   skip=66637, nrows = 2880, sep=";", stringsAsFactors=FALSE)


power<-mutate(power, datetime = paste(power$Date, power$Time))
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")
power$datetime<-strptime(power$datetime, format = "%d/%m/%Y %H:%M:%S")


png(file="plot4.png", width=504, height = 504)
par(col = "black", mfrow = c(2,2))

plot(x = power$datetime, y = power$Global_active_power, xlab ="", ylab = "Global Active Power",
     main = NULL, col="black", type="l")

plot(x = power$datetime, y = power$Voltage, xlab="datetime", ylab ="Voltage",
     main = NULL, col="black", type="l")


plot(x = power$datetime, y = power$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering", main = NULL, col="black")
lines(x = power$datetime,  y = power$Sub_metering_2, col="red")
lines(x = power$datetime,  y = power$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lty = 1, bty = "n")

plot(x = power$datetime, y = power$Global_reactive_power, xlab = "datetime", 
     ylab = "Energy Sub Metering", main = NULL, col = "black", type = "l")
dev.off()
