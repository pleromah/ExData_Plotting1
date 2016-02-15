
###################################################################
#This script loads the data household_power_consumption.txt into R#
#and plots a graphi showing the Global active power consumption   #
#of households between 2007-02-01 and 2007-02-02                  #
#                                                                 #
###################################################################

#reads the first 1000000 rows of data from household_power_consumption.txt and stores it into variable hpc
hpc = read.table("household_power_consumption.txt", header = TRUE, sep=";"
                 , na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)

#merges Date and Time variables
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time, sep = " ")
                         , format = "%d/%m/%Y %H:%M:%S")

#Converts Date to date datatype
hpc$Date <- as.Date (hpc$Date,format="%d/%m/%Y")

#extract the needed dataset and store in hpc1
hpc_subset <- subset(hpc,as.Date(hpc$Date) >="2007-02-01" 
                     & as.Date(hpc$Date) <="2007-02-02")


#plot the graph
with(hpc_subset, plot(y=Global_active_power,x=DateTime, type = "l",
                      xlab ="", ylab="Global Active Power (kilowatts)"))

