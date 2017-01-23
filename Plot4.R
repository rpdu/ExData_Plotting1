# Load household_power_consumption into HPC_data and HPC_2days for plotting purpose of assignment.
HPC_file <- "./Project/household_power_consumption/household_power_consumption.txt"
HPC_data <- read.table(HPC_file,sep = ";", header = TRUE, na.strings="?")
HPC_data$date_time <- with(HPC_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
HPC_2days <-subset(HPC_data, date_time >= "2007-02-01 00:00:00" & date_time < "2007-02-03 00:00:00")

par(mfcol = c(2, 2))
with(HPC_2days, {
  plot( date_time,Global_active_power, type = "l" ,ylab = "Global Active Power",xlab = "" )
  plot( date_time,Sub_metering_1, type = "l",ylab = "Energy Sub Metering",xlab = "" ) 
    with(subset(HPC_2days),points( date_time,Sub_metering_2, type = "l", col="red"))
    with(subset(HPC_2days),points( date_time,Sub_metering_3, type = "l",col="blue"))
    legend("topright", bty = "n", col = c("black","blue", "red"), lty = c(1,1,1),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot( date_time,Voltage, type = "l" ,ylab = "Voltage",xlab = "datetime" )
    plot( date_time,Global_reactive_power, type = "l" ,ylab = "Global_reactive_power",xlab = "datetime" )

    })

dev.copy(png,"Project/plot4.png")
dev.off()
if(dev.cur() == 1) dev.new()