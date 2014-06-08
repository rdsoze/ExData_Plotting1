#read data only for 1st and 2ns Feb 2007
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, nrows=2880, skip=66636, stringsAsFactors=FALSE)
#add the column names
colnames(data) <- colnames(read.table("household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))

#converting to data and time
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

#plot
png("plot3.png", width=480, height=480)
with(data,plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metring", xlab=" "))
with(data,lines(DateTime, Sub_metering_2, col="red"))
with(data,lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, cex=1, col=c("black","red","blue"), legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
dev.off()