#plot2.R
source('./getConsumptionDataSubset.R')
dfr <- getConsumptionDataSubset()

doPlot2 <- function(){ # we call this 2x so functionalize it.
  plot(dfr$DateTime,dfr$Global_active_power,type='l',
       ylab="Global Active Power (kilowatts)",
       xlab='',
       main="Global Active Power"
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
doPlot2()


# Re plot in file

# Forum suggestion https://class.coursera.org/exdata-015/forum/thread?thread_id=38
# Isabella Evans refers to
# http://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html
# It suggests:
png(file="./plot2.png",width=480,height=480)
doPlot2()

dev.off()
