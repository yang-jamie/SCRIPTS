#!/usr/bin/Rscript
# Plot average expression change over various timepoints
# Created 9/12/2018

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=F,sep="\t",fill=T)

vector1 = c(mean(data1[,3]),mean(data1[,4]),mean(data1[,5]),mean(data1[,6]),mean(data1[,7]))
x_vector=c(0,15,30,60,240)

png(args[2])
plot(x_vector,vector1,ylab="Average expression change",xlab="Time (min)",col="black",pch=19)
lines(x_vector,vector1)
dev.off()
