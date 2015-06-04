#plot3.R
source('./getConsumptionDataSubset.R')
dfr <- getConsumptionDataSubset()

# plot 4a is same as plot2
doPlot2 <- function(){ # we call this 2x so functionalize it.
  plot(dfr$DateTime,dfr$Global_active_power,type='l',
       ylab="Global Active Power (kilowatts)",
       xlab='',
       main="Global Active Power"
  )
}
doPlot4b=function(){
  plot(dfr$DateTime,dfr$Voltage,type='l',
       ylab="Voltage",
       xlab="datetime",
       main=""
  )
}
doPlot3 <- function(){ #  This is also 4c
  plot(dfr$DateTime,dfr$Sub_metering_1,type='l',
       ylab="Energy sub metering",
       xlab='',
       main=""
       )
  lines( dfr$DateTime,dfr$Sub_metering_2,col='red')
  lines( dfr$DateTime,dfr$Sub_metering_3,col='blue')
  
}
doPlot4d <- function(){
    plot(dfr$DateTime,dfr$Global_reactive_power,type='l',
         ylab="Voltage",
         xlab='datetime',
         main=""
    )
}

# Platform selection based on http://stackoverflow.com/a/4463105/1795127
# Get picture on screen
switch(Sys.info()[['sysname']],
       Windows= {windows()},
       Linux  = {x11()},
       Unix  = {x11},
       Darwin = {quartz()}
       )
par(mfrow=c(2,2))  
# layout
#   4a= plot2 | 4b (new)
#   4c= plot3 | 4d (new)

doPlot2() # plot 4a is copy of plot 2
doPlot4b()

doPlot3() # plot 4c is copy of plot 3
doPlot4d()


# Re plot in file

# Forum suggestion https://class.coursera.org/exdata-015/forum/thread?thread_id=38
# Isabella Evans refers to
# http://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html
# It suggests:
png(file="./plot4.png",width=480,height=480)
par(mfrow=c(2,2))  
# layout
#   4a= plot2 | 4b (new)
#   4c= plot3 | 4d (new)

doPlot2() # plot 4a is copy of plot 2
doPlot4b()

doPlot3() # plot 4c is copy of plot 3
doPlot4d()

dev.off()
