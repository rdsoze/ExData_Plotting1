#read data only for 1st and 2ns Feb 2007
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, nrows=2880, skip=66636, stringsAsFactors=FALSE)
#add the column names
colnames(data) <- colnames(read.table("household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))

#converting to data and time
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
                        
#plot
png("plot2.png", width=480, height=480)
plot(data$DateTime, as.numeric(data$Global_active_power), type="l", xlab=" ", ylab="Global Active Power (Kilowatts)")
dev.off()