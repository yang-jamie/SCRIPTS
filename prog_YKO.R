#!/usr/bin/Rscript
# Plot average expression change over various timepoints
# Created 6/5/2018

args = commandArgs(T)
file = args[1]
data1 <- read.table(file,header=F,sep="\t",fill=T)

vector1 = c(mean(data1[,2]),mean(data1[,3]),mean(data1[,4]),mean(data1[,5]),mean(data1[,6]),mean(data1[,7]))
x_vector=c('log','pre-stress','15m','30m','60m','4hr')

png(args[2])
plot(vector1,xaxt='n',main="Average expression",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
dev.off()
