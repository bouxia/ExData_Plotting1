all_data <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,dec=".",na.strings="?")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
my_data <- subset(all_data,Date >= "2007-02-01"& Date <= "2007-02-02")

my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S")

my_data$datetime <- as.POSIXct(my_data$datetime)
attach(my_data)

png("plot2.png",width = 480, height = 480)
with(my_data,plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")) 
dev.off()