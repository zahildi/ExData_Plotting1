plot4 <- function(){

    library("sqldf")
    library("lubridate")

    ## open Power Data, using library sqldf
    PowerData <- read.csv.sql("./data/household_power_consumption.txt", 
                    sql= "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep=";", header=TRUE)
    
    PowerData$datetime <- as.POSIXct(paste(PowerData$Date, PowerData$Time),
                                format="%d/%m/%Y %H:%M:%S")
    
    par(mfcol = c(2, 2))
    
    with(PowerData, {
        ## first plot, in top left
        
        plot(datetime, Global_active_power, type="l",
             ylab="Global Active Power (kilowatts)", xlab ="")
        
        ## second plot, in lower left
    
        plot(datetime, Sub_metering_1, type="n",
             ylab="Energy sub metering", xlab ="")
        
        points(datetime, Sub_metering_1, type="l",col="black")
        points(datetime, Sub_metering_2, type="l",col="red")
        points(datetime, Sub_metering_3, type="l",col="blue")
        
        legend("topright", lty=c(1,1), col=c("black","red" ,"blue"), 
               cex=0.8, 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        ## third plot, in top right 
        plot(datetime, Voltage, type="l")
        
        ## fourth plot, in bottom right
        plot(datetime, Global_reactive_power, type="l")
        
    ## close the plot
    })
    
    ## copy to a png file
    dev.copy(png, file = "plot4.png")
    dev.off()
    
    par(mfcol = c(1, 1))
    
    print("Plot saved as plot4.png in working directory")
}