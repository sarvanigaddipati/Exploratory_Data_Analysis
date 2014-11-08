png(file="plot3.png",width = 480, height = 480) 
#to save my historical image in plot1.png opened file in working directory
library(sqldf) 
#used sql code so to read that library of sql been called
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
#working got an error to avoid that i used the above code when reading my file.
file_path="household_power_consumption.txt";
#Text file path is assigned to file_path
Dataplot3<-read.csv.sql(file_path,sql="SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')",sep=";",header=TRUE);
#Using sql reading the content file which having the dates 1/2/2007 and 2/2/2007
Dataplot3$DateTime = as.POSIXct(strptime(paste(Dataplot3$Date,Dataplot3$Time), "%d/%m/%Y %H:%M:%S"));
#Using paste merging the date and time columns and coverting them to as date using strptime

with(Dataplot3,plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
#ploting the graph for sub_metering_1 column 
with(Dataplot3,points(DateTime,Sub_metering_2,type="l",col="red"))
#In the sing grapth to plot many points is used. Using that plotted graph for sub_metering_2
with(Dataplot3,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#to have a reperesentation of all the three meterics top right legend is used.
dev.off()
#Intially opened a connection file to copy the image. To close it I used above line of code.
