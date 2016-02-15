###################################################################
#This script loads the data household_power_consumption.txt into R#
#and plots a histogram showing the Global active power consumption#
#of households between 2007-02-01 and 2007-02-02                  #
#                                                                 #
###################################################################

#reads the first 1000000 rows of data from household_power_consumption.txt and stores it into variable hpc
hpc = read.table("household_power_consumption.txt", header = TRUE, sep=";"
                 , na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)

#Converts Date to date datatyppe
hpc$Date <- strptime(as.character(hpc$Date), "%d/%m/%Y")

#extract the needed dataset and store in hpc_subset
hpc_subset <- subset(hpc,as.Date(hpc$Date) >="2007-02-01" 
                     & as.Date(hpc$Date) <="2007-02-02")

#set the plot margins
par(mfrow=c(1,1), mar=c(4,4,2,1))

#plots a histogram showing frequency of Global Active power 
hist(hpc_subset$Global_active_power,col="red", 
     xlab = "Global Reactive Power (Kilowatts)",
     main = "Global Active Power")

#saves the histogram as plot1.png
dev.copy(png, file="plot1.png")
dev.off()