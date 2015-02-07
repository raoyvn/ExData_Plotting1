# set current working directory to load data file from 
setwd("/Users/venkata/Downloads/coursera/Exploratory Data Analysis/Week 1/Assignment")

# read in the table of household power consumption
consumption <- read.table("household_power_consumption.txt", header=TRUE , sep = ";")

# mark missing data with NA 
consumption[consumption == "?"] <- NA

# remove rows which have NA data in any columns 
consumption <- consumption[complete.cases(consumption),]

# format date time so that it can be used for time series graphs
consumption$formattedDate  <- strptime(paste(consumption$Date,consumption$Time), "%d/%m/%Y %H:%M:%S")

# format date so that filter operators like >= etc can be used 
consumption$Date <- as.Date(consumption$Date ,  "%d/%m/%Y")

# filter date just to the required days 
consumption <- subset(consumption, Date >= "2007-02-01" & Date < "2007-02-03")

# grab a device with required viewport 
dev.new(width=480,height=480)

# plot the histogram 
plot(x=consumption$formattedDate  , y=as.numeric(levels(consumption$Global_active_power))[consumption$Global_active_power] , ylab=paste("Global Active Power (kilowatts)"), xlab="", type="l"  )

# copy it to a png file 
dev.copy(png,'plot2.png')

# release the device 
dev.off()








