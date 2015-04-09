## name: plot4.R
## see parameters.functions.R for a description of how data is created
## ----------------- description of plot creation -----------------------------
## places plot1 and plot2 along with 2 other graphs in same figure
## uses par(mfrow = c(2,2)) to tell R to make a graph of 4 graphs
## adds Voltage x T and Global_reactive_power x T
## copy graph from window to png
## reset mfrow to default
## Note: I do not use datetime as an x-axis label, and I use a label for Global Reactive Power
## Note: the legend on Sub_metering panel is a little larger than one shown in the assignment
##       I could have used cex to decrease the size of the legend text but didn't seem important

source("parameters.functions.R")

graph.df <- get.graph.data(zipdir=dataDir, zipfile=outfile, zipurl=url, fileinzip=filename, df=plot.data.name)

## wrote graph directly to png
png(file = "plot4.png")
par(mfrow = c(2, 2))
with(graph.df, plot(T, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main=""))

with(graph.df, plot(T, Voltage, type="l", xlab="", ylab="Voltage", main=""))

with(graph.df, plot(T, Sub_metering_1, type="l", col="black", xlab="", ylab=""))
par(new=T)
with(graph.df, plot(T, Sub_metering_2, type="l", col="red", ylim=yrange, axes=F, xlab="", ylab=""))
par(new=T)
with(graph.df, plot(T, Sub_metering_3, type="l", col="blue", ylim=yrange, axes=F, xlab="", ylab="Energy sub metering"))
legend("topright", lty=1, bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(graph.df, plot(T, Global_reactive_power, type="l", xlab="", ylab="Global Reactive Power", main=""))

## dev.copy(png, "plot4.png")
dev.off()
par(mfrow = c(1, 1))
