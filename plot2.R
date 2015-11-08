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


### Plot the Graph for Question 2
png(file = "plot2.png", width = 504, height = 504,bg="transparent")



plot(x = data$Time, y= data$Global_active_power, main = NULL,
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")





dev.off()

