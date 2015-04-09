## name: plot1.R
## see parameters.functions.R for a description of how data is created
## ----------------- description of plot creation -----------------------------
## histogram of Global_active_power with red columns (col), titled and x-axis labeled
## copies plot from screen to png

source("parameters.functions.R")

graph.df <- get.graph.data(zipdir=dataDir, zipfile=outfile, zipurl=url, fileinzip=filename, df=plot.data.name)

with(graph.df, hist(Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.copy(png, "plot1.png")
dev.off()
## another approach to saving plot as png
## png(file = "plot1.png")
## with(graph.df, hist(Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
## dev.off()
