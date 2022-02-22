library("chron")

# read in the data
df <- read.csv("household_power_consumption.txt", sep=";")

# format dates and times
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- times(df$Time)

# get subset of the 2 days we are interested in
subset_df <- df[df$Date > as.Date("2007-01-31") & 
                  df$Date < as.Date("2007-02-03"), ]

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# upper left
plot(subset_df$Time, subset_df$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="", xaxt='n')
axis(1, at=c(0,0.5,1), labels=c("Thu", "Fri", "Sat"))

# upper right plot
plot(subset_df$Time, subset_df$Voltage, type="l", ylab="Voltage", 
     xlab="datetime", xaxt='n')
axis(1, at=c(0,0.5,1), labels=c("Thu", "Fri", "Sat"))

# lower left is plot 3
plot(subset_df$Time, subset_df$Sub_metering_1, type="l", col="black", 
     ylab="Energy sub metering", xlab="", xaxt="n")
lines(subset_df$Time, subset_df$Sub_metering_2, col="red", type="l")
lines(subset_df$Time, subset_df$Sub_metering_3, col="blue", type="l")
axis(1, at=c(0,0.5,1), labels=c("Thu", "Fri", "Sat"))
legend(x = "topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                                 "Sub_metering_3"),
       bty = "n", lty=c(1,1,1),
       col=c("black", "red", "blue"))


# lower right
plot(subset_df$Time, subset_df$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime", xaxt='n')
axis(1, at=c(0,0.5,1), labels=c("Thu", "Fri", "Sat"))

dev.off()
