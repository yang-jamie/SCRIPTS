#!/usr/bin/Rscript
# Plot trajectory of all mRNAs over the various time points
# Created 6/17/2018

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=T,sep="\t")
data2 <- data1[,2:7]
x_vector=c('log','pre-stress','15m','30m','60m','4hr')
ymax <- as.numeric(args[2])

png(args[3])
hello <- as.numeric(data2[1,])
plot(hello,main="Trajectory of every mRNA",xaxt='n',col="red",pch=19,ylim=c(0,ymax))

for (i in 2:dim(data1)[1]) {
  hello <- as.numeric(data2[i,])
  lines(hello)
}

axis(1,at=1:6,labels=x_vector)
dev.off()

