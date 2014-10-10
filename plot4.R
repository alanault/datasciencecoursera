# Coursera: exploratory data analysis
# Project 1
# Script to create plot 4
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
# Plot 4: combination plot
#

# first, create the filename
png (filename="plot4.png",
     width=480, height=480)

# now set the number of plots we want
par (mfrow=c(2,2)) # created in rows

# now we can plot our charts

#plot 1
with (data, plot (Time, Global_active_power, xlab="", ylab="Global Active Power", type="l"))
#plot 2
with (data, plot (Time, Voltage, xlab="datetime", ylab="Voltage", type="l"))

# plot 3 - borrowed from earlier
# now plot the graph we want - start with empty frame and add
plot (data$Time, data$Sub_metering_1, type="n",
      ylab="Energy sub metering",
      xlab="")

# now plot data lines
lines (data$Time, data$Sub_metering_1) # black line for 1
lines (data$Time, data$Sub_metering_2, col="red") # red line for 2
lines (data$Time, data$Sub_metering_3, col="blue") # blue for line 3

# now add legend
legend ("topright", 
        lty=c(1,1),
        col=c("black", "red", "blue"),
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
# plot 4
with (data, plot (Time, Global_reactive_power, xlab="dattime", ylab="Global_reactive_power", type="l"))


# now, dev.off to close out the file
dev.off()

