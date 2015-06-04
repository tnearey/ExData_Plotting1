#plot1.R
dfr <- getConsumptionDataSubset()

doPlot1 <- function(){ # we call this 2x so functionalize it.
  hist(dfr$Global_active_power,
       xlab="Global Active Power (kilowatts)",
       col='red',
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
doPlot1()


# Re plot in file

# Forum suggestion https://class.coursera.org/exdata-015/forum/thread?thread_id=38
# Isabella Evans refers to
# http://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html
# It suggests:
png(file="./plot1.png",width=480,height=480)
doPlot1()

dev.off()
