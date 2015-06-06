plot1 <- function(){

    library("sqldf")
    
    ## down and dirty method of reading the required data
    ## powerdata <- read.table("./data/household_power_consumption.txt",
    ##                  sep=";", header=TRUE)
    ## reqPowerData <- subset(powerdata, Date == "1/2/2007" | Date=="2/2/2007")
    ##rm(powerdata)

    ## more elegant solution, using library sqldf
    PowerData <- read.csv.sql("./data/household_power_consumption.txt", 
                    sql= "select * from file where Date in ('1/2/2007', '2/2/2007')",
                    sep=";", header=TRUE)
    
    png(file="plot1.png",width=480,height=480)
    
    hist(reqPowerData2$Global_active_power, col="red", 
         main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    dev.off()
    
    print("Plot saved as plot1.png in working directory")
}