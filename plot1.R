#read data only for 1st and 2ns Feb 2007
data = read.csv("household_power_consumption.txt", sep=";", header=TRUE, nrows=2880, skip=66636, stringsAsFactors=FALSE)
#add the column names
colnames(data) = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";"))

#plot
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="GlobalActive Power (kilowatts)", main="Global Active Power")
dev.off()