png(file="plot4.png",width = 480, height = 480) 
#to save my historical image in plot1.png opened file in working directory
par(mfrow=c(2,2))
library(sqldf)
#used sql code so to read that library of sql been called
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
#working got an error to avoid that i used the above code when reading my file.
file_path="household_power_consumption.txt";
#Text file path is assigned to file_path
Dataplot4<-read.csv.sql(file_path,sql="SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')",sep=";",header=TRUE);
#Using sql reading the content file which having the dates 1/2/2007 and 2/2/2007
Dataplot4$DateTime = as.POSIXct(strptime(paste(Dataplot4$Date,Dataplot4$Time), "%d/%m/%Y %H:%M:%S"));
#Using paste merging the date and time columns and coverting them to as date using strptime
plot(Dataplot4$DateTime,Dataplot4$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
#ploting between weekdays and Global Active Power 
plot(Dataplot4$DateTime,Dataplot4$Voltage,type="l",xlab="datetime",ylab="Voltage")
#ploting between weekdays and voltage
with(Dataplot4,plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
#ploting the graph for sub_metering_1 column 
with(Dataplot4,points(DateTime,Sub_metering_2,type="l",col="red"))
#In the sing grapth to plot many points is used. Using that plotted graph for sub_metering_2
with(Dataplot4,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#to have a reperesentation of all the three meterics top right legend is used.
plot(Dataplot4$DateTime,Dataplot4$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#ploting between weekdays and Global Reactive Power 
dev.off()
#Intially opened a connection file to copy the image. To close it I used above line of code.
