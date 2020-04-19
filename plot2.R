powercon <- read.csv('household_power_consumption.txt',sep=';',na.strings = '?') ## reading from the given file
powercon1 <- powercon[powercon$Date== '1/2/2007',] # getting all the rows corresponding to the 1st of February 2007
powercon2 <- powercon[powercon$Date== '2/2/2007',] # getting all the rows corresponding to the 2nd of February 2007
powercon <- rbind(powercon1,powercon2) # binding together all the rows collected for the two days
powercon$Date <- apply(powercon[ , c("Date","Time")] , 1 , paste , collapse = ":" )# pasting the Date and Time collumns to get a
Dates <- as.POSIXct(powercon$Date, format='%d/%m/%Y:%H:%M:%S')   # getting the date/time values for the collumns we pasted above                                                                                    # complete time series value
png(file='plot2.png') # opening the graphic file device for the png file
plot(Dates, powercon$Global_active_power ,type="l",xlab='',
     ylab='Global Active Power(killowatts)') #creating the plot and setting the axis labels
dev.off() #closing the graphic device

powercon <- read.csv('household_power_consumption.txt',sep=';',na.strings = '?')