## --------------------------- parameters -------------------------------------
### url: location of an archived extract of the UC Irvine Machine Learning Repo 
### dataDir: where local copy of archive is saved
### outfile: name of local copy of archive
### filename: name of file in archive
### plot.data.name: (character) name of data used in plots
## --------------------------- functions --------------------------------------
##
## check.create.dir
### if directory (dir) does not exist create it
### used to create the data directory

## get.graph.data
##   tests whether plot data has been loaded if not then...
###    downloads archive and saves it in dataDir
###    reads data and sets as missing values with "?"
###    finds size of data in memory and estimates size
###    converts the Date variable into a date value
###    selects only data having Date in 2/1/2007 and 2/2/2007
###    converts Date and Time values into a datetime variable
###    returns the subset of the archive
##   if plot data exists, return the plot data using get

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataDir="data"
outfile <- "hh.power.consumption.zip"
filename <- "household_power_consumption.txt"
plot.data.name <- "graph.df"

check.create.dir <- function(dir="data") {
    if (!file.exists(dir)) {
        dir.create(dir)
    }
}

get.graph.data <- function(zipdir, zipfile, zipurl, fileinzip, df){
    if (!exists(df)){
        check.create.dir(dir=zipdir)
        out.file <- paste(zipdir, zipfile, sep="/")
        if (!file.exists(out.file)) {
            download.file(url, destfile=out.file, method = "curl")
        }
        ## how much memory
        ## 2,075,259 rows and 9 columns
        df.rows <- 2075259
        df <- read.table(unz(out.file, fileinzip), sep=";", header=T, na.strings="?")
        print(paste("Size of Data in Memory: ", object.size(df)))
        print(paste("Estimated size of Data: ", df.rows * 9 * 8))
        ## 149418648, actual size 133003464 bytes
        df$Date <- as.Date(df$Date, "%d/%m/%Y")
        ## subset data
        graph.df <- df[which(df$Date %in% as.Date(c("2007-02-01", "2007-02-02"))), ]
        ## add datetime variable
        graph.df$T <- as.POSIXct(paste(as.character(graph.df$Date), as.character(graph.df$Time)), format="%Y-%m-%d %H:%M:%S")
        graph.df
    }
    else {
        print(paste("Returning", df))
        get(df)
    }
}

