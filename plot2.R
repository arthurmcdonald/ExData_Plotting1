library("chron")

# read in the data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                 na="?")

# get subset of the 2 days we are interested in
subset_df <- df[df$Date == "1/2/2007" | 
                  df$Date == "2/2/2007", ]

subset_df$datetime <- as.POSIXlt.character(paste(subset_df$Date, 
                                                 subset_df$Time),
                                           format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(subset_df$datetime, subset_df$Global_active_power, type="l", 
     ylab="Global Active Power (killowatts)", xlab="")
dev.off()
