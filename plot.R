# Read txt file : Load the power consumption dataset as a data frame
powerConsum <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# Convert Date column to Date format and DateTime column to datetime format
powerConsum$Date <- as.Date(powerConsum$Date, format = "%d/%m/%Y")
powerConsum$DateTime <- strptime(paste(powerConsum$Date, powerConsum$Time), format = "%Y-%m-%d %H:%M:%S")

# Subset the data to include only the data for February 1st and February 2nd, 2007
powerConsum <- powerConsum[powerConsum$Date >= "2007-2-1" & powerConsum$Date <= "2007-2-2", ]

# Convert the columns from 3 to 8 to numeric type
powerConsum[, 3:8] <- lapply(powerConsum[, 3:8], as.numeric)

# Plot a histogram of the Global_active_power column
with(powerConsum, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
dev.copy(device = png, width = 480, height = 480, file = "plot_1.png")

# Plot a line graph of Global_active_power vs. DateTime, Add x-axis ticks
with(powerConsum, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]), as.numeric(powerConsum$DateTime[1441]), as.numeric(powerConsum$DateTime[2880])), labels = c("Thu", "Fri", "Sat"))
dev.copy(device = png, width = 480, height = 480, file = "plot_2.png")

# Plot a line graph of Sub_metering_1 vs. DateTime, Add x-axis ticks
with(powerConsum, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n", xlab = "", ylab = "Energy sub metering"))
with(powerConsum, lines(DateTime, Sub_metering_1))
with(powerConsum, lines(DateTime, Sub_metering_2, col = "red"))
with(powerConsum, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]), as.numeric(powerConsum$DateTime[1441]), as.numeric(powerConsum$DateTime[2880])), labels = c("Thu", "Fri", "Sat"))
dev.copy(device = png, width = 480, height = 480, file = "plot_3.png")

# Constructing last plot
with(powerConsum, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", 
                       ylab = "Global_reactive_power", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Save Plot4
dev.copy(device = png, width = 480, height = 480, file = "plot_4.png")
