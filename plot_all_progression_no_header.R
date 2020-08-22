#!/usr/bin/Rscript
# Plot trajectory of all mRNAs over the various time points

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=F,sep="\t")
data2 <- data1[,2:7]
x_vector=c('log','pre-stress','15m','30m','60m','4hr')
data.matrix(data2, rownames.force = NA)
hello <- colMeans(data2)

ymax <- max(hello)
ymin <- min(hello)

png(args[2])
plot(c(0,0,0,0,0,0),main="Trajectory of average mRNA",xaxt='n',col="white",pch=19,ylim=c(ymin,ymax))
lines(hello)

#for (i in 1:dim(data2)[1]) {
#  lines(hello)
#}

axis(1,at=1:6,labels=x_vector)
dev.off()

