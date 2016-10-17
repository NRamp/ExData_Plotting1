#### Created on 10/16/2016
##### Exploratory Data Analysis
##### Plot 4

#### Reading the Power consumption data 

pl4<- read.table("household_power_consumption.txt",skip=1,sep=";")

## Displaying column names

names(pl4)

### Replacing column names
names(pl4) <- c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

### Subsetting for just the required 2 days - Note date is in dd/mm/yyyy
subpl4 <- subset(pl4,pl4$Date=="1/2/2007" | pl4$Date =="2/2/2007")


# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpl4$Date <- as.Date(subpl4$Date, format="%d/%m/%Y")
subpl4$Time <- strptime(subpl4$Time, format="%H:%M:%S")
subpl4[1:1440,"Time"] <- format(subpl4[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpl4[1441:2880,"Time"] <- format(subpl4[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#### opening a png device to write the plot
png(filename="plot4.png",width=480, height=480)


#calling the basic plot function & adding the required lines for sub-metering 1, 2 &3 
### Also coloring the sub_metering lines appropriately & the labels required
### Adding the title Energy Sub-Metering

# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(subpl4,{

### Plotting the 1st panel with Active Power
  
   plot(subpl4$Time,as.numeric(as.character(subpl4$Global_active_power)),type="l",  xlab="datetime",ylab="Global Active Power")  

### Plotting the 2nd panel with voltage details 

  plot(subpl4$Time,as.numeric(as.character(subpl4$Voltage)), type="l",xlab="datetime",ylab="Voltage")

### Plotting the 3rd panel with sub_Metering details

  plot(subpl4$Time,subpl4$Sub_metering_1,type="n",xlab="datetime",ylab="Energy sub metering")
   with(subpl4,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(subpl4,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(subpl4,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

#### Lastly the 4th panel with Reactive Power

  plot(subpl4$Time,as.numeric(as.character(subpl4$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")

})

# annotating graph

### Turning off Device
dev.off()
