#####                   plot1.R 
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

# Set graphic device and plot Global Active Power
png('plot1.png', width = 480, height = 480)
hist(dat$Global_active_power, 
     col = 'red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
dev.off() # Close device and finalise plot
