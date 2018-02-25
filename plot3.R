###plot 3 - week1 of Exploratory data analysis

##setting the working directory
setwd(paste0("C:/Users/bhargavab250/Documents/Kolkata/Coursera",
             "/Exploratory data analysis/Week 1/Project"))

##clear the console
rm(list = ls(all=T))

##read the input file
power_consumption <- read.table(file = "household_power_consumption.txt", 
                                header = T,sep = ";", na.strings = "?")

##format the date and subset the data for given dates (01/02/2007 & 02/02/2007)

power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")

given_dates <- as.Date(c('01/02/2007', '02/02/2007'), format = "%d/%m/%Y")

power_consmpn_req <- power_consumption[which(power_consumption$Date %in% 
                                                   given_dates),]

##New column with Date-Time formatting

power_consmpn_req$DateTime<-strptime(paste(power_consmpn_req$Date,
                                           power_consmpn_req$Time),
                                     format = "%Y-%m-%d %H:%M:%S")

##plot the histogram to a png file using png file device

png(filename = "plot3.png", width = 480, height = 480)
with(power_consmpn_req, {
      plot(DateTime, Sub_metering_1, type = "n", xlab = "",
           ylab = "Energy sub metering")
      lines(DateTime, Sub_metering_1, type = "l", col = "black")
      lines(DateTime, Sub_metering_2, type = "l", col = "red")
      lines(DateTime, Sub_metering_3, type = "l", col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                    "Sub_metering_3"),
             col = c("black", "red", "blue"), lty = 1)
}
)
dev.off()
