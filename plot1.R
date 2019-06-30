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

#plotting 
hist(data$Global_active_power, 
     main="Global Active Power", 
     col="red", 
     xlab = "Global Active Power (kilowatts)")

#saving
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
