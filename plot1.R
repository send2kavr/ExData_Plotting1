## seting the working Director

setwd("E:/R Programming/R Coursera/Exploratory Data Analysis/Week 1")

library(data.table)


#Reading the data file then subsets data for specified dates
projectData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")


# Prevents histogram from printing in scientific notation
projectData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
projectData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
projectData <- projectData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(projectData[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
