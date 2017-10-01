#####                   plot2.R 
#####     for Coursera Explanatory Data Analysis
#####               Course project 1

setwd('~/Documents/Coursera/04_Exploratory_Data_Analysis/Week_1/')

# Read in file
dat <- read.table('household_power_consumption.txt',
                  header = T, 
                  sep = ';', 
                  stringsAsFactors = F, 
                  colClasses = c(rep('character', 2), 
                                 rep('numeric', 7)), 
                  na.strings = '?')

# Column dat$Date to class date
dat$Date <- as.Date(dat$Date, 
                    format = '%d/%m/%Y')

# Select dates 2007-02-01 and 2007-02-02
dat <- dat[dat$Date == '2007-02-01' | dat$Date == '2007-02-02', ]

# Create column DateTime with class date
dat$DateTime <- paste(dat$Date, dat$Time, sep = ' ')
dat$DateTime <- strptime(dat$DateTime, format = '%Y-%m-%d %H:%M:%S')

# Set graphic device and plot Global Active Power
png('plot2.png', width = 480, height = 480)
plot(x = dat$DateTime,  
     y = dat$Global_active_power, type = 'l', 
     ylab = 'Global Active Power (kilowatts)',
     xlab = '')
dev.off() # Close device and finalise plot
