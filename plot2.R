## Script to explore R Base Graphing Package as part of Cousera JHU Data Science Course
## This is Project 1 of Course 4 - Exploratory Data Analysis, this produces plot 2 of 4 a plot of Global Active Power
## by C. Bleile

# Outline:
# 1. Set environment
# 2. Import data.table from "household_power_consumption.txt"
# 3. Clean and manipulate datatypes
# 4. Subset the data
# 5. Output the plot

# 1. Set environment, you can make the working directory anything that works for you, just make sure the .txt file is there.
setwd("~") #Set the working directory to the user's home directory; NOTE: unzipped, downloaded data should be here.
library(data.table) #Needed so we can use fread function to read in "household_power_consumption.txt" to a data table.

# 2. Import data.table from "household_power_consumption.txt"
HHpower <- fread(input = "household_power_consumption.txt", na.strings="?")

# 3. Clean and manipulate datatypes (dates from chr to date type, etc.)
HHpower$POSIXdateTime <- as.POSIXct(paste(HHpower$Date, HHpower$Time), format = "%d/%m/%Y %H:%M:%S")
#HHpower$Date <- as.Date(HHpower$Date, format = "%d/%m/%Y") #had to create POSIXdateTime above as POSIXct includes date
#HHpower$Time <- as.POSIXct(HHpower$Time, format = "%H:%M:%S") #Considering using POSIXlt to get at named vectors

# 4. Subset the data
HHpowerSubset <- subset(HHpower, HHpower$POSIXdateTime >= "2007-02-01" & HHpower$POSIXdateTime < "2007-02-03")

# 5. Output the plot
png("plot2.png", width=480, height=480) #sets output device to plot2.png located in the working directory
plot(HHpowerSubset$POSIXdateTime, HHpowerSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() #closes the png output device


