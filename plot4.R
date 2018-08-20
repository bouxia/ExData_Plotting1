all_data <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,dec=".",na.strings="?")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
my_data <- subset(all_data,Date >= "2007-02-01"& Date <= "2007-02-02")

my_data$datetime <- strptime(paste(my_data$Date, my_data$Time), "%Y-%m-%d %H:%M:%S")

my_data$datetime <- as.POSIXct(my_data$datetime)
attach(my_data)

png("plot4.png",width = 480, height = 480)

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(my_data,{
        plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(Voltage ~ datetime, type = "l")
        plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "") 
        points(Sub_metering_2 ~ datetime, type = "l", col="red")
        points(Sub_metering_3 ~ datetime, type = "l", col="blue")
        legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Global_reactive_power ~ datetime, type = "l")
})

dev.off()