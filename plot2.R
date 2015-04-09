## name: plot2.R
## see parameters.functions.R for a description of how data is created
## ----------------- description of plot creation -----------------------------
## 2-way plot of Global_active_power (y-axis) by datetime (T) using lines (type="l"), no x label, y label, no title
## copies plot from screen to png

source("parameters.functions.R")

graph.df <- get.graph.data(zipdir=dataDir, zipfile=outfile, zipurl=url, fileinzip=filename, df=plot.data.name)

with(graph.df, plot(T, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main=""))
dev.copy(png, "plot2.png")
dev.off()

