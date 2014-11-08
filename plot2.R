png(file="plot2.png",width = 480, height = 480) 
#to save my historical image in plot1.png opened file in working directory
library(sqldf) 
#used sql code so to read that library of sql been called
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
#working got an error to avoid that i used the above code when reading my file.
file_path="household_power_consumption.txt";
#Text file path is assigned to file_path
Dataplot2<-read.csv.sql(file_path,sql="SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')",sep=";",header=TRUE);
#Using sql reading the content file which having the dates 1/2/2007 and 2/2/2007
Dataplot2$DateTime = as.POSIXct(strptime(paste(Dataplot2$Date,Dataplot2$Time), "%d/%m/%Y %H:%M:%S"));
#Using paste merging the date and time columns and coverting them to as date using strptime
plot(Dataplot2$DateTime,Dataplot2$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
#ploting between weekdays and Global Active Power 
dev.off()
#Intially opened a connection file to copy the image. To close it I used above line of code.
