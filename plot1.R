library("chron")

# read in the data
df <- read.csv("household_power_consumption.txt", sep=";")

# format dates and times
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- times(df$Time)

# get subset of the 2 days we are interested in
subset_df <- df[df$Date > as.Date("2007-01-31") & 
                  df$Date < as.Date("2007-02-03"), ]

# plot the chart and save to png
png(file="plot1.png", width=480, height=480)
hist(as.numeric(subset_df$Global_active_power), col="red", 
     main="Global Active Power", xlab="Global Active Power (killowatts)")
dev.off()