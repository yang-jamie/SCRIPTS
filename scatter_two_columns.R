#!/usr/bin/Rscript
# Scatter plot between any two given columns
# Created 8/7/18

args = commandArgs(T)
file = args[1]
data <- read.table(file,header=T,sep="\t",fill=T)
col1 <- as.numeric(args[2])
col2 <- as.numeric(args[3])

png(args[4])
plot(as.numeric(data[,col1]),as.numeric(data[,col2]),xlab="YKO",ylab="RNA-seq",pch=19)
dev.off()
