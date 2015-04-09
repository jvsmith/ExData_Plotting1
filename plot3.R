## name: plot3.R
## see parameters.functions.R for a description of how data is created
## ----------------- description of plot creation -----------------------------
## using datetime in the x-axis, plots using lines (type="l") three variables Sub_metering_x, x=1, 2, 3
## finds the range over all Sub_metering_x variables and uses this range for each graph (ylim=)
## adds one series at a time, par(new=T) allows the subsequent graphs to be added instead of replacing the previous graph
## no x-axis label, title, only y-axis labeled
## copies plot from screen to png

source("parameters.functions.R")

graph.df <- get.graph.data(zipdir=dataDir, zipfile=outfile, zipurl=url, fileinzip=filename, df=plot.data.name)

yrange <- with(graph.df, range(Sub_metering_1, Sub_metering_2, Sub_metering_3))

## graph didn't copy well
png(file = "plot3.png")

with(graph.df, plot(T, Sub_metering_1, type="l", col="black", xlab="", ylab=""))
par(new=T)
with(graph.df, plot(T, Sub_metering_2, type="l", col="red", ylim=yrange, axes=F, xlab="", ylab=""))
par(new=T)
with(graph.df, plot(T, Sub_metering_3, type="l", col="blue", ylim=yrange, axes=F, xlab="", ylab="Energy sub metering"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## dev.copy(png, "plot3.png")
dev.off()
