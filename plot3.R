### read Data file into R
### extract each 1440 obs for 2007/02/01 and 2007/02/02
url <- "./household_power_consumption.txt"
data <- read.table(url, header = TRUE, sep =";", na.strings = "?", skip = 66636,
                   nrows = 2880, stringsAsFactors = FALSE)
names <- read.table(url, header = FALSE, sep =";", na.strings = "?", 
                    nrows = 1, stringsAsFactors = FALSE)
colnames(data) <- names[1,]
remove(names, url)

### convert charcter into Date and Time

data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


### Plot the Graph for Question 3
png(file = "plot3.png", width = 504, height = 504,bg="transparent")

plot(x = data$Time, y= data$Sub_metering_1, main = NULL,
     xlab = "", ylab = "Energy Sub metering", type = "n")
points(x = data$Time, y= data$Sub_metering_1, main = NULL,
     type = "l")
points(x = data$Time, y= data$Sub_metering_2, main = NULL, col = "red",
      type = "l")
points(x = data$Time, y= data$Sub_metering_3, main = NULL, col = "blue",
      type = "l")
legend("topright", lty =  c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1",
    "Sub_metering_2","Sub_metering_3"))



dev.off()

