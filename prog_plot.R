#!/usr/bin/Rscript
# Plot average expression change over various timepoints
# Created 4/30/2018

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=T,sep="\t")
file2 = args[2]
data2 <- read.table(file2,header=T,sep="\t")
file3 = args[3]
data3 <- read.table(file3,header=T,sep="\t")
file4 = args[4]
data4 <- read.table(file4,header=T,sep="\t")
file5 = args[5]
data5 <- read.table(file5,header=T,sep="\t")
file6 = args[6]
data6 <- read.table(file6,header=T,sep="\t")
file7 = args[7]
data7 <- read.table(file7,header=T,sep="\t")
file8 = args[8]
data8 <- read.table(file8,header=T,sep="\t")
file9 = args[9]
data9 <- read.table(file9,header=T,sep="\t")
file10 = args[10]
data10 <- read.table(file10,header=T,sep="\t")

vector1 = c(mean(data1[,2]),mean(data1[,3]),mean(data1[,4]),mean(data1[,5]),mean(data1[,6]),mean(data1[,7]))
vector2 = c(mean(data2[,2]),mean(data2[,3]),mean(data2[,4]),mean(data2[,5]),mean(data2[,6]),mean(data2[,7]))
vector3 = c(mean(data3[,2]),mean(data3[,3]),mean(data3[,4]),mean(data3[,5]),mean(data3[,6]),mean(data3[,7]))
vector4 = c(mean(data4[,2]),mean(data4[,3]),mean(data4[,4]),mean(data4[,5]),mean(data4[,6]),mean(data4[,7]))
vector5 = c(mean(data5[,2]),mean(data5[,3]),mean(data5[,4]),mean(data5[,5]),mean(data5[,6]),mean(data5[,7]))
vector6 = c(mean(data6[,2]),mean(data6[,3]),mean(data6[,4]),mean(data6[,5]),mean(data6[,6]),mean(data6[,7]))
vector7 = c(mean(data7[,2]),mean(data7[,3]),mean(data7[,4]),mean(data7[,5]),mean(data7[,6]),mean(data7[,7]))
vector8 = c(mean(data8[,2]),mean(data8[,3]),mean(data8[,4]),mean(data8[,5]),mean(data8[,6]),mean(data8[,7]))
vector9 = c(mean(data9[,2]),mean(data9[,3]),mean(data9[,4]),mean(data9[,5]),mean(data9[,6]),mean(data9[,7]))
vector10 = c(mean(data10[,2]),mean(data10[,3]),mean(data10[,4]),mean(data10[,5]),mean(data10[,6]),mean(data10[,7]))

x_vector=c('log','pre-stress','15m','30m','60m','4hr')

png("WT_MSN2.png")
plot(vector1,xaxt='n',main="Average expression of MSN2 targets in WT",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
lines(x=1:6,y=c(30.0067449690728,17.0636691510264,61.5755125947994,56.4811491830496,67.9084178159045,41.6065330828616))
dev.off()

png("WT_MSN4.png")
plot(vector2,xaxt='n',main="Average expression of MSN4 targets in WT",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
lines(x=1:6,y=c(18.6677532948534,12.264127771305,38.3039472044441,39.620674575631,36.4004158528271,29.0126021844161))
dev.off()

png("WT_YAP1.png")
plot(vector3,xaxt='n',main="Average expression of YAP1 targets in WT",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
lines(x=1:6,y=c(44.4679145673138,28.9962454137271,112.191276889539,106.38453769961,100.018802545313,86.5940844334573))
dev.off()

png("EV_MSN2.png")
plot(vector4,xaxt='n',main="Average expression of MSN2 targets in evolved",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
lines(x=1:6,y=c(32.1065706790741,14.5866164450269,78.3987299522812,43.5355438253745,60.4430103936039,47.4481113890644))
dev.off()

png("EV_MSN4.png")
plot(vector5,xaxt='n',main="Average expression of MSN4 targets in evolved",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
lines(x=1:6,y=c(25.3015218623526,13.3832593031174,62.0845383095216,49.9327247641433,33.2564794731962,40.583769703186))
dev.off()

png("EV_YAP1.png")
plot(vector6,xaxt='n',main="Average expression of YAP1 targets in evolved",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
lines(x=1:6,y=c(46.3597180312283,24.2188454222093,100.395056842276,62.5201950975638,75.3283788796654,78.0838586561906))
dev.off()

png("WT_ESR_ind.png")
plot(vector7,xaxt='n',main="Average expression of induced ESR genes in WT",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
dev.off()

png("WT_ESR_rep.png")
plot(vector8,xaxt='n',main="Average expression of repressed ESR genes in WT",ylab="Expression",col="green",pch=19)
axis(1,at=1:6,labels=x_vector)
dev.off()

png("EV_ESR_ind.png")
plot(vector9,xaxt='n',main="Average expression of induced ESR genes in evolved",ylab="Expression",col="red",pch=19)
axis(1,at=1:6,labels=x_vector)
dev.off()

png("EV_ESR_rep.png")
plot(vector10,xaxt='n',main="Average expression of repressed ESR genes in evolved",ylab="Expression",col="green",pch=19)
axis(1,at=1:6,labels=x_vector)
dev.off()

#plot(rpkm1,rpkm2,main=args[3],xlab="rpkm1",ylab="rpkm2",pch=19)
