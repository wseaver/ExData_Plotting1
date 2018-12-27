#  load date, pare down to relevant dates
full_power <- read.csv('household_power_consumption.txt',
                       sep=';',
                       na.strings = "?")
full_power$Global_active_power <- as.numeric(full_power$Global_active_power)
full_power$keepDate <- full_power$Date
full_power$Date <- as.Date(full_power$Date,'%d/%m/%Y')
powerdf <- full_power[(full_power$Date == '2007-02-01')|(full_power$Date == '2007-02-02'),]

#  set relevant data types
powerdf$datetime <- paste(powerdf$keepDate,powerdf$Time)
powerdf$datetime <- strptime(powerdf$datetime,format='%d/%m/%Y %H:%M:%S')
powerdf$Sub_metering_1 <- as.numeric(powerdf$Sub_metering_1)
powerdf$Sub_metering_2 <- as.numeric(powerdf$Sub_metering_2)
powerdf$Sub_metering_3 <- as.numeric(powerdf$Sub_metering_3)
powerdf$Global_reactive_power <- as.numeric(powerdf$Global_reactive_power)

# draw hist
hist(powerdf$Global_active_power,
     breaks=12,
     col='Red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power',
     plot=TRUE)



