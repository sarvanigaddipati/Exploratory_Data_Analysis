png(file="plot1.png",width=480,height=480) 
#to save my historical image in plot1.png opened file in working directory
library(sqldf) 
#used sql code so to read that library of sql been called
source("http://sqldf.googlecode.com/svn/trunk/R/sqldf.R")
#working got an error to avoid that i used the above code when reading my file.
file_path="household_power_consumption.txt";
#Text file path is assigned to file_path
Dataplot1<-read.csv.sql(file_path,sql="SELECT * FROM file WHERE Date IN ('1/2/2007', '2/2/2007')",sep=";",header=TRUE);
#Using sql reading the content file which having the dates 1/2/2007 and 2/2/2007
hist(Dataplot1[,3],xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
#plotting graph for Global_active_power variable for the dates 1/2/2007 and 2/2/2007
dev.off()
#Intially opened a connection file to copy the image. To close it I used above line of code.
