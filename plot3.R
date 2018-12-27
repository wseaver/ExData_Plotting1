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

#  draw plot without lines
plot(
     powerdf$datetime,
     powerdf$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "",
     #yaxt = "n",
     yaxs = 'r',
     type="n")

#  draw each line
lines(powerdf$datetime,
      powerdf$Sub_metering_1
      )
lines(powerdf$datetime,
      powerdf$Sub_metering_2,
      col = 'red'
      )
lines(powerdf$datetime,
      powerdf$Sub_metering_3,
      col = 'blue'
      )
#  add legend, string vector should align with column color vector
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       col=c("black","red","blue")
       )

