data<-read.table('household_power_consumption.txt',header = TRUE ,sep = ';')
#data$Date<-as.Date(data$Date ,'%d/%m/%Y')
dataf<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
dt<-strptime(paste(dataf$Date, dataf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
dataf<-cbind(dataf,dt)

plot(dataf$dt,dataf$Global_active_power,type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')

#dev.copy(png, file="plot3.png", height=480, width=480)
#dev.off()