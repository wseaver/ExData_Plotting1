full_power <- read.csv('household_power_consumption.txt',
                       sep=';',
                       na.strings = "?")
full_power$Global_active_power <- as.numeric(full_power$Global_active_power)
full_power$keepDate <- full_power$Date
full_power$Date <- as.Date(full_power$Date,'%d/%m/%Y')
powerdf <- full_power[(full_power$Date == '2007-02-01')|(full_power$Date == '2007-02-02'),]



powerdf$datetime <- paste(powerdf$keepDate,powerdf$Time)
powerdf$datetime <- strptime(powerdf$datetime,format='%d/%m/%Y %H:%M:%S')
powerdf$Sub_metering_1 <- as.numeric(powerdf$Sub_metering_1)
powerdf$Sub_metering_2 <- as.numeric(powerdf$Sub_metering_2)
powerdf$Sub_metering_3 <- as.numeric(powerdf$Sub_metering_3)
powerdf$Global_reactive_power <- as.numeric(powerdf$Global_reactive_power)

par(mfcol=c(2,2))
#  top left
plot(powerdf$datetime,
     powerdf$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="n")

lines(powerdf$datetime,
      powerdf$Global_active_power,
      lty='solid')

#  bottom left
plot(
  powerdf$datetime,
  powerdf$Sub_metering_1,
  ylab = "Energy sub metering",
  xlab = "",
  #yaxt = "n",
  yaxs = 'r',
  type="n")
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
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,
       col=c("black","red","blue"),
       bty = "n"
)

# top right
plot(powerdf$datetime,
     powerdf$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     type="n")
lines(powerdf$datetime,
      powerdf$Voltage,
      col = 'black'
)

# bottom right
plot(powerdf$datetime,
     powerdf$Global_reactive_power,
#     ylim = range(0,0.5),
      ylab = "Global_reactive_power",
      xlab = "datetime",
     type="n")
lines(powerdf$datetime,
      powerdf$Global_reactive_power,
      col = 'black'
      )
