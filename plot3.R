#plot3.R
dfr <- getConsumptionDataSubset()

doPlot3 <- function(){ # we call this 2x so functionalize it.
  plot(dfr$DateTime,dfr$Sub_metering_1,type='l',
       ylab="Energy sub metering",
       xlab='',
       main=""
       )
  lines( dfr$DateTime,dfr$Sub_metering_2,col='red')
  lines( dfr$DateTime,dfr$Sub_metering_3,col='blue')
  

  
}

# Platform selection based on http://stackoverflow.com/a/4463105/1795127
# Get picture on screen
switch(Sys.info()[['sysname']],
       Windows= {windows()},
       Linux  = {x11()},
       Unix  = {x11},
       Darwin = {quartz()}
       )
doPlot3()


# Re plot in file

# Forum suggestion https://class.coursera.org/exdata-015/forum/thread?thread_id=38
# Isabella Evans refers to
# http://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html
# It suggests:
png(file="./plot3.png",width=480,height=480)
doPlot1()

dev.off()
