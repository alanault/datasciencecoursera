# Coursera: exploratory data analysis
# Project 1
# Script to create plot 2
# Alan Ault

#
# 1. Make reading the data reproduceable
#

# setwd to where my data lives
setwd ("./Coursera/Data_analysis/")

# read the actual data
data <- read.table (file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, stringsAsFactors=FALSE)

# make backup, so we don't keep loading if something goes wrong!
data_backup <- data

# filter by the days we want
# 2007-02-1 and 2007-02-02
data <- data [which (data$Date=="1/2/2007" | data$Date=="2/2/2007"), ]  

# format date/time so we can use them
# do Time first, by adding the date field, so we get a single value with 
# the correct date, rather than a default "today" value
data$Time <- strptime (paste (data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date (data$Date, format="%d/%m/%Y")



#
# Plot 1: Global Active Power linechart by day
#

# first, create the filename
png (filename="plot2.png",
     width=480, height=480)

# now plot the graph we want
plot (data$Time, data$Global_active_power, type="l",
      ylab="Global Active Power (kilowatts",
      xlab="")

# now, dev.off to close out the file
dev.off()

