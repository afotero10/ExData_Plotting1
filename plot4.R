data<-read.table('household_power_consumption.txt',header = TRUE ,sep = ';')
#data$Date<-as.Date(data$Date ,'%d/%m/%Y')
dataf<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
dt<-strptime(paste(dataf$Date, dataf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
dataf<-cbind(dataf,dt)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataf, {
  plot(dt,Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(dt,Voltage, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(dt,Sub_metering_1,type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')
  lines(dt,Sub_metering_2,col='Red')     
  lines(dt,Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dt,Global_reactive_power, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#dev.copy(png, file="plot3.png", height=480, width=480)
#dev.off()