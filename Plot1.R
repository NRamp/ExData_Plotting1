#### Created on 10/16/2016
##### Exploratory Data Analysis
##### Plot 1

#### Reading the Power consumption data 

pl1<- read.table("household_power_consumption.txt",skip=1,sep=";")

## Displaying column names

names(pl1)

### Replacing column names
names(pl1) <- c("Date","Time","Global_active_power",
"Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

### Subsetting for just the required 2 days - Note date is in dd/mm/yyyy
subpl1 <- subset(pl1,pl1$Date=="1/2/2007" | pl1$Date =="2/2/2007")

### opening a png device to write the plot
png(filename="Plot1.png")

#calling the basic plot function
hist(as.numeric(as.character(subpl1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph

dev.off()