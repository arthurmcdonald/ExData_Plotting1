library("chron")

# read in the data
df <- read.csv("household_power_consumption.txt", sep=";")

# format dates and times
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- times(df$Time)

# get subset of the 2 days we are interested in
subset_df <- df[df$Date > as.Date("2007-01-31") & 
                  df$Date < as.Date("2007-02-03"), ]

png(file="plot2.png", width=480, height=480)
plot(subset_df$Time, subset_df$Global_active_power, type="l", 
     ylab="Global Active Power (killowatts)", xlab="", xaxt='n')
axis(1, at=c(0,0.5,1), labels=c("Thursday", "Friday", "Saturday"))
dev.off()
