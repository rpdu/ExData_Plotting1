# Load household_power_consumption into HPC_data and HPC_2days for plotting purpose of assignment.
HPC_file <- "./Project/household_power_consumption/household_power_consumption.txt"
HPC_data <- read.table(HPC_file,sep = ";", header = TRUE, na.strings="?")
HPC_data$date_time <- with(HPC_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
HPC_2days <-subset(HPC_data, date_time >= "2007-02-01 00:00:00" & date_time < "2007-02-03 00:00:00")

with(HPC_2days, plot( date_time,Global_active_power, type = "l" ,ylab = "Global Active Power (kilowatts)",xlab = "" ))
dev.copy(png,"Project/plot2.png")
dev.off()
if(dev.cur() == 1) dev.new()