

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


png(file="plot1.png", width=504, height = 504)

hist(power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
