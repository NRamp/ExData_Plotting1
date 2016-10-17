#### Created on 10/16/2016
##### Exploratory Data Analysis
##### Plot 3

#### Reading the Power consumption data 

pl3<- read.table("household_power_consumption.txt",skip=1,sep=";")

## Displaying column names

names(pl3)

### Replacing column names
names(pl3) <- c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

### Subsetting for just the required 2 days - Note date is in dd/mm/yyyy
subpl3 <- subset(pl3,pl3$Date=="1/2/2007" | pl3$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpl3$Date <- as.Date(subpl3$Date, format="%d/%m/%Y")
subpl3$Time <- strptime(subpl3$Time, format="%H:%M:%S")
subpl3[1:1440,"Time"] <- format(subpl3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpl3[1441:2880,"Time"] <- format(subpl3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

### opening a png device to write the plot
png(filename="Plot3.png", width=480,height=480)

#calling the basic plot function & adding the required lines for sub-metering 1, 2 &3 
### Also coloring the sub_metering lines appropriately & the labels required
### Adding the title Energy Sub-Metering

plot(subpl3$Time,subpl3$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpl3,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpl3,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpl3,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

# annotating graph
title(main="Energy Sub-Metering")
 
### Turning off Device
dev.off()