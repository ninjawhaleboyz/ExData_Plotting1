powercon <- read.csv('household_power_consumption.txt',sep=';',na.strings = '?') # reading from the given file
powercon1 <- powercon[powercon$Date== '1/2/2007',] # getting all the rows corresponding to the 1st of February 2007
powercon2 <- powercon[powercon$Date== '2/2/2007',] # getting all the rows corresponding to the 2nd of February 2007
powercon <- rbind(powercon1,powercon2) # binding together all the rows collected for the two days
png(file='plot1.png') # opening the graphic file device for the png file
hist(powercon$Global_active_power, main='Global Active Power',xlab='Global Active Power(killowatts)',col='red') #creating the histogram
dev.off() #closing the graphic device