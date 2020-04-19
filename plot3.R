powercon <- read.csv('household_power_consumption.txt',sep=';',na.strings = '?') # reading from the given file
powercon1 <- powercon[powercon$Date== '1/2/2007',] # getting all the rows corresponding to the 1st of February 2007
powercon2 <- powercon[powercon$Date== '2/2/2007',] # getting all the rows corresponding to the 2nd of February 2007
powercon <- rbind(powercon1,powercon2) # binding together all the rows collected for the two days
powercon$Date <- apply(powercon[ , c("Date","Time")] , 1 , paste , collapse = ":" )# pasting the Date and Time collumns into one 
#to get a complete time series value. 
Dates <- as.POSIXct(powercon$Date, format='%d/%m/%Y:%H:%M:%S')   # getting the date/time values for the collumns we pasted above                                                                                
png(file='plot3.png') # opening the graphic file device for the png file
plot(Dates, powercon$Sub_metering_1 ,type="l",xlab='',
     ylab='Energy sub metering')             #ploting tha first line and seting the axis labels
lines(Dates,powercon$Sub_metering_2,col='red')           #ploting the second line
lines(Dates, powercon$Sub_metering_3, col='blue')        #ploting the third line
legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1) #setting the legend  
dev.off() #closing the graphic device