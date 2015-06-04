getConsumptionDataSubset = function (reset = FALSE){
  library(data.table)
  library(lubridate)
  # Get data from relevant dates and return as data frame
  # Args:
  #    1) reset = FALSE -- if TRUE , recreate the .RData file 
  # Returns:
  #  dataframe with variables in useful formats for plotting tasks, including
  # most importantly
  # Version 1.0.0     Thu Jun  4 10:37:56 2015
  # Notes:
  # 1) consumptionDataSubset.RData is created if necessary,  loaded as a data.frame and returned to caller
  # 2) It is assumed that the data has been unzipped into the file `household_power_consumption.txt` from
  # `https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip`
  #   and stored in same directory as this .R file. 
  # 2) If the file does not already exist or if reset == TRUE, this function
  #   produces the file consumptionDataSubset.RData with a subset of data from the
  #   desired time period  2007-02-01 and 2007-02-02
  
  
#   reset=TRUE # for now
  if ((!file.exists('./consumptionDataSubset.RData')) || reset ){
    #   1  Date: Date in format dd/mm/yyyy
    #   2  Time: time in format hh:mm:ss
    #   3  Global_active_power: household global minute-averaged active power (in kilowatt)
    #   4  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
    #   5  Voltage: minute-averaged voltage (in volt)
    #   6  Global_intensity: household global minute-averaged current intensity (in ampere)
    #   7  Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
    #   8  Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
    #   9  Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
    colClasses=c('char', 'char', rep('numeric',7))
    # Read in to data table as characters, converting ? to NA strings
    dtb=fread('../Project1RawData/household_power_consumption.txt', sep=';', colClasses=rep('character',9),
              na.strings=c('?')
              # select rows based on date string pattern
             
    )
    # Select rows with appropriate dates
    inx= grep("\\b0?[1,2]/0?2/2007\\b",dtb$Date,perl=TRUE)
#     print (class(dtb))
# select approptiate rows and make a normal data.frame
    dfr=data.frame(dtb[inx,])

#     print(summary(dfr))
#     print(class(dfr))
    # Convert formats strptime() and as.Date() functions
# dfr$Date=as.Date(dfr$Date)
# dfr$Time=strptime(dfr$Time,format='%H:%M:%S' )
# from Forum https://class.coursera.org/exdata-015/forum/thread?thread_id=24
# Zach's comment 'starting from scratch'

print(unique(dfr$Date))
dfr$DateTime <- dmy_hms(paste(dfr$Date, dfr$Time))
# browser()
for (i in 3:9){
dfr[,i]=as.numeric(dfr[,i])
}
    # and others to numeric
#   print(summary(dfr))
cat('Saving file ./consumptionDataSubset.RData\n')
    save(dfr,file='./consumptionDataSubset.RData')
    
    
  }else{
    cat('Loading file consumptionDataSubset.RData\n')
    load(file='./consumptionDataSubset.RData')
  }
  return(dfr)
}
# development scaffolding
# go=function(){
# dfr=getConsumptionDataSubset()
# browser()
# }