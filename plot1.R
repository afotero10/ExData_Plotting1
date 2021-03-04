data<-read.table('household_power_consumption.txt',header = TRUE ,sep = ';')
#data$Date<-as.Date(data$Date ,'%d/%m/%Y')
dataf<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

dt<-strptime(paste(dataf$Date, dataf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
dataf<-cbind(dataf,dt)

hist(as.numeric(dataf$Global_active_power),col = 'red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)',ylim = c(0,1300))

#dev.copy(png, file="plot3.png", height=480, width=480)
#dev.off()