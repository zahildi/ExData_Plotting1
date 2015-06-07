plot3 <- function(){

    library("sqldf")
    library("lubridate")

    ## open Power Data, using library sqldf
    PowerData <- read.csv.sql("./data/household_power_consumption.txt", 
                    sql= "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep=";", header=TRUE)
    
    PowerData$datetime <- as.POSIXct(paste(PowerData$Date, PowerData$Time),
                                format="%d/%m/%Y %H:%M:%S")
    
    ## if line below is commented out, the plot will be sent to the screen
    png(file="plot3.png",width=480,height=480) 
    
    plot(PowerData$datetime, PowerData$Sub_metering_1, type="n",
         ylab="Energy sub metering", xlab ="")
    
    points(PowerData$datetime, PowerData$Sub_metering_1, type="l",col="black")
    points(PowerData$datetime, PowerData$Sub_metering_2, type="l",col="red")
    points(PowerData$datetime, PowerData$Sub_metering_3, type="l",col="blue")
    
    legend("topright", lty=c(1,1), col=c("black","red" ,"blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## if the plot is sent to the screen, uncomment below to copy to a file
    ## dev.copy(png, file= "plot3.png") 
    dev.off()
    
    print("Plot saved as plot3.png in working directory")
}