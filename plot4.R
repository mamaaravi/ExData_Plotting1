#uploading data
setwd("D:/datasciencecourse/EDA 1")
filename<-"./household_power_consumption.txt"
data<-read.table(filename,
                 header=TRUE,
                 sep=";", na="?",
                 colClasses = c("character", "character", rep("numeric",7)))
head(data)
summary(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#top left
plot(data$Global_active_power~data$DateTime,
       type="l",
       ylab="Global Active Power",
       xlab="")
#top right
plot(data$Voltage~data$DateTime,
     type="l",
     ylab="Voltage",
     xlab="Datetime")
#bottom left
with(data, plot(Sub_metering_1~DateTime,
                type="l",
                ylab="Energy sub metering",
                xlab=""))
lines(data$Sub_metering_2~data$DateTime, col="Red")
lines(data$Sub_metering_3~data$DateTime, col="Blue")
legend("topright",
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=1)
#bottom right
plot(data$Global_reactive_power~data$DateTime,
       type="l",
       ylab="Global reactive power",
       xlab="Datetime")

#saving
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()