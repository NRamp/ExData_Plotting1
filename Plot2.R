#### Created on 10/16/2016
##### Exploratory Data Analysis
##### Plot 2

#### Reading the Power consumption data 

pl2<- read.table("household_power_consumption.txt",skip=1,sep=";")

## Displaying column names

names(pl2)

### Replacing column names
names(pl2) <- c("Date","Time","Global_active_power",
"Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

### Subsetting for just the required 2 days - Note date is in dd/mm/yyyy
subpl2 <- subset(pl2,pl2$Date=="1/2/2007" | pl2$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpl2$Date <- as.Date(subpl2$Date, format="%d/%m/%Y")
subpl2$Time <- strptime(subpl2$Time, format="%H:%M:%S")
subpl2[1:1440,"Time"] <- format(subpl2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpl2[1441:2880,"Time"] <- format(subpl2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

### opening a png device to write the plot
png(filename="Plot2.png",width = 480, height = 480)

#calling the basic plot function & adding the required Axes labels

plot(subpl2$Time,as.numeric(as.character(subpl2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
 
### Turning off Device
dev.off()
