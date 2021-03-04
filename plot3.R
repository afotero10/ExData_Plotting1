data<-read.table('household_power_consumption.txt',header = TRUE ,sep = ';')
#data$Date<-as.Date(data$Date ,'%d/%m/%Y')
dataf<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
dt<-strptime(paste(dataf$Date, dataf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
dataf<-cbind(dataf,dt)

with(dataf,{plot(dt,Sub_metering_1,type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')
lines(dt,Sub_metering_2,col='Red')     
lines(dt,Sub_metering_3,col='Blue')
} )

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, file="plot3.png", height=480, width=480)
#dev.off()