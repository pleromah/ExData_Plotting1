###################################################################
#This script loads the data household_power_consumption.txt into R#
#and plots a graphi showing the Global active power consumption   #
#of households between 2007-02-01 and 2007-02-02                  #
#                                                                 #
###################################################################

#reads the first 1000000 rows of data from household_power_consumption.txt and stores it into variable hpc
#File has been saved to the working directory
hpc = read.table("household_power_consumption.txt", header = TRUE, sep=";"
                 , na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)

#merges Date and Time variables
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time, sep = " ")
                         , format = "%d/%m/%Y %H:%M:%S")

#Converts Date to date datatype
hpc$Date <- as.Date (hpc$Date,format="%d/%m/%Y")

#extract the needed dataset and store in hpc_subset
hpc_subset <- subset(hpc,as.Date(hpc$Date) >="2007-02-01" 
                     & as.Date(hpc$Date) <="2007-02-02")

par(mfcol=c(2,2))

#plot graph 1 - Global_active_power
with(hpc_subset, plot(y=Global_active_power,x=DateTime, type = "l",
                      xlab ="", ylab="Global Active Power"))

#plot graph 2 -Energy sub metering
with(hpc_subset, plot(y=Sub_metering_1,x=DateTime, type = "n",
                      xlab ="", ylab="Energy sub metering"))
#Sub_metering_1
with(hpc_subset, lines(y=Sub_metering_1,x=DateTime))
#Sub_metering_2
with(hpc_subset, lines(y=Sub_metering_2,x=DateTime,col="blue"))
#Sub_metering_3
with(hpc_subset, lines(y=Sub_metering_3,x=DateTime,col="red"))
#draws the legend
legend("topright",inset = .02, box.lty = 0, lty = 1:1, col=c("black","blue","red"),pch=c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2"," Sub_metering_3"), cex = .5)

#plot graph 3 - Voltage
with(hpc_subset, plot(y=Voltage,x=DateTime, type = "l",
                      xlab ="", ylab="Voltage"))

#plot graph 4 -Global_reactive_power
with(hpc_subset, plot(y=Global_reactive_power,x=DateTime, type = "l",
                      xlab ="", ylab="Global_reactive_power"))

#saves the graph as plot4.png
dev.copy(png, file="plot4.png")
dev.off()
