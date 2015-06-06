plot1 <- function(){

    library("sqldf")
    
    ## down and dirty method of reading the required data
    ## reads all data into memory, then creates a subseet of the data
    
    ## Allpowerdata <- read.table("./data/household_power_consumption.txt",
    ##                  sep=";", header=TRUE)
    ## PowerData <- subset(powerdata, Date == "1/2/2007" | Date=="2/2/2007")
    ## rm(powerdata)

    ## more elegant solution, using library sqldf
    PowerData <- read.csv.sql("./data/household_power_consumption.txt", 
                    sql= "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep=";", header=TRUE)
    
    
    ## if line below is commented out, the plot will be sent to the screen
    png(file="plot1.png",width=480,height=480) 
    
    hist(PowerData$Global_active_power, col="red", 
         main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    ## if the plot is sent to the screen, uncomment below to copy to a file
    ## dev.copy(png, file= "plot1.png") 
    dev.off()
    
    print("Plot saved as plot1.png in working directory")
}