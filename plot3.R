library("chron")

# read in the data
df <- read.csv("household_power_consumption.txt", sep=";")

# format dates and times
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- times(df$Time)

# get subset of the 2 days we are interested in
subset_df <- df[df$Date > as.Date("2007-01-31") & 
                  df$Date < as.Date("2007-02-03"), ]

plot(subset_df$Time, subset_df$Sub_metering_1, type="l", col="black", 
     ylab="Energy sub metering")
lines(subset_df$Time, subset_df$Sub_metering_2, col="red", type="l")
lines(subset_df$Time, subset_df$Sub_metering_3, col="blue", type="l")