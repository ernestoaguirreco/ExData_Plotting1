y<-read.table("Test.txt", header = TRUE, sep = ";")
z<-rbind(subset(x, Date == "1/2/2007"), subset(x, Date == "2/2/2007"))
z<-transform(z, DateTime = paste(Date, Time))
z<-transform(z,DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S"))
b<-c(0,40)
a<-range(z$DateTime)
c<-as.numeric(as.character(z$Sub_metering_1))
d<-as.numeric(as.character(z$Sub_metering_2))
e<-as.numeric(as.character(z$Sub_metering_3))
s<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(filename = "C:/R/Exploratory Data Analysis/Project 1/Plot3.png", width = 480, height = 480, units = "px")
plot(a,b, xlab = "", ylab = "Energy Sub Metering")
lines(z$DateTime, c , pch = "0")
lines(z$DateTime, d , pch = "0", col = "red")
lines(z$DateTime, e , pch = "0", col = "blue")
legend("topright", s, lty = 1, cex = 0.75, col = c("black", "red", "blue"))
dev.off()
