library("chron")

# read in the data
df <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,
               na="?")

# get subset of the 2 days we are interested in
subset_df <- df[df$Date == "1/2/2007" | 
                  df$Date == "2/2/2007", ]

subset_df$datetime <- as.POSIXlt.character(paste(subset_df$Date, 
                                                 subset_df$Time),
                                           format = "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# upper left
plot(subset_df$datetime, subset_df$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="")

# upper right plot
plot(subset_df$datetime, subset_df$Voltage, type="l", ylab="Voltage", 
     xlab="datetime")

# lower left is plot 3
plot(subset_df$datetime, subset_df$Sub_metering_1, type="l", col="black", 
     ylab="Energy sub metering", xlab="")
lines(subset_df$datetime, subset_df$Sub_metering_2, col="red", type="l")
lines(subset_df$datetime, subset_df$Sub_metering_3, col="blue", type="l")
legend(x = "topright", legend=c("Sub_metering_1", "Sub_metering_2", 
                                 "Sub_metering_3"),
       bty = "n", lty=c(1,1,1),
       col=c("black", "red", "blue"))


# lower right
plot(subset_df$datetime, subset_df$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()
