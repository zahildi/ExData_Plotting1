plot2 <- function(){

    library("sqldf")
    library("lubridate")

    ## open Power Data, using library sqldf
    ## data is stored in a data directory in the Working Directory
    PowerData <- read.csv.sql("./data/household_power_consumption.txt", 
                    sql= "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep=";", header=TRUE)
    
    ## Create a POSIXct datetime field from the Date and Time fields
    PowerData$datetime <- as.POSIXct(paste(PowerData$Date, PowerData$Time),
                                format="%d/%m/%Y %H:%M:%S")
    
    ## if line below is commented out, the plot will be sent to the screen
    png(file="plot2.png",width=480,height=480) 
    
    plot(PowerData$datetime, PowerData$Global_active_power, type="l",
         ylab="Global Active Power (kilowatts)", xlab ="")
    
    ## if the plot is sent to the screen, uncomment below to copy to a file
    ## dev.copy(png, file= "plot2.png") 
    dev.off()
    
    print("Plot saved as plot2.png in working directory")
}