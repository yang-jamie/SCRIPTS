#!/usr/bin/Rscript
# Plot correlation between rpkm datasets
# Created 4/9/2018

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=T,sep="\t")
file2 = args[2]
data2 <- read.table(file2,header=T,sep="\t")
rpkm1 <- as.numeric(data1[,8])
rpkm2 <- as.numeric(data2[,8])

cor.test(rpkm1,rpkm2)

png(args[3])
plot(rpkm1,rpkm2,main=args[3],xlab="rpkm1",ylab="rpkm2",pch=19)
dev.off()
