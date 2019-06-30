# uploading data
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


datetime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(datetime)

#plotting
plot(data$Global_active_power~data$DateTime,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#saving
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()