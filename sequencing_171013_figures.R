#!/usr/bin/Rscript
# Create figures of survival
# Created 6/26/2018

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=T,sep="\t")
data2 <- data1[data1[,3]==args[2],]
data_naive <- data2[data2[,6]==0,]
data3 <- data2[data2[,6]==args[3],]
data_pop <- data3[data3[,4]=="pop",]
data_col <- data3[data3[,4]=="col",]
data_seq <- data_col[data_col[,7]<=args[4],]
data_unseq <- data_col[data_col[,7]>args[4],]

setEPS(args[5])

# Create blank plot with defined axes
plot(0,xlab="",ylab="Percent survival",xlim=c(0,3+as.numeric(args[4])),ylim=c(0,100),col="white",xaxt="n",yaxt="n")
axis(2,at=seq(0,100,10))
if (args[4]==0) {
  axis(1,at=0.5:(2.5+as.numeric(args[4])),labels=c("naive","pop.","other col."))
} else if (args[4]==1) {
  axis(1,at=0.5:(2.5+as.numeric(args[4])),labels=c("naive","pop.","colony 1","other col."))
} else if (args[4]==2) {
  axis(1,at=0.5:(2.5+as.numeric(args[4])),labels=c("naive","pop.","colony 1","colony 2","other col."))
} else if (args[4]==3) {
  axis(1,at=0.5:(2.5+as.numeric(args[4])),labels=c("naive","pop.","colony 1","colony 2","colony 3","other col."))
}

# Plot naive points
for (i in 1:dim(data_naive)[1]) {
  points(0.5,data_naive[i,2]/data_naive[i,1]*100,pch=19,col="black",cex=.5)
}

# Plot naive average
avg <- mean(data_naive[,2]/data_naive[,1]*100)
lines(c(.1,.9),c(avg,avg),col="black",lwd=2)

# Plot pop points
for (i in 1:dim(data_pop)[1]) {
  points(1.5,data_pop[i,2]/data_pop[i,1]*100,pch=19,col="red",cex=.5)
}

# Plot pop average
avg <- mean(data_pop[,2]/data_pop[,1]*100)
lines(c(1.1,1.9),c(avg,avg),col="red",lwd=2)

# T test between naive and pop
t_value <- t.test(data_naive[,2]/data_naive[,1],data_pop[,2]/data_pop[,1],alternative="l")
if (t_value$p.value<.05) {
  lines(c(.5,1.5),c(80,80),col="black")
  points(1,81,pch=8,col="black",cex=.75)
}

# Plot sequenced colony points and averages and t test
if (args[4]==1) {
  for (i in 1:dim(data_seq)[1]) {
    points(2.5,data_seq[i,2]/data_seq[i,1]*100,pch=19,col="green",cex=.5)
  }
  avg <- mean(data_seq[,2]/data_seq[,1]*100)
  lines(c(2.1,2.9),c(avg,avg),col="green",lwd=2)
  t_value <- t.test(data_naive[,2]/data_naive[,1],data_seq[,2]/data_seq[,1],alternative="l")
  if (t_value$p.value<.05) {
    lines(c(.5,2.5),c(85,85),col="black")
    points(1.5,86,pch=8,col="black",cex=.75)
  }
} else if (args[4]==2) {
  data_temp <- data_seq[data_seq[,7]==1,]
  for (i in 1:dim(data_temp)[1]) {
    points(2.5,data_temp[i,2]/data_temp[i,1]*100,pch=19,col="green",cex=.5)
  }
  avg <- mean(data_temp[,2]/data_temp[,1]*100)
  lines(c(2.1,2.9),c(avg,avg),col="green",lwd=2)
  t_value <- t.test(data_naive[,2]/data_naive[,1],data_temp[,2]/data_temp[,1],alternative="l")
  if (t_value$p.value<.05) {
    lines(c(.5,2.5),c(85,85),col="black")
    points(1.5,86,pch=8,col="black",cex=.75)
  }

  data_temp <- data_seq[data_seq[,7]==2,]
  for (i in 1:dim(data_temp)[1]) {
    points(3.5,data_temp[i,2]/data_temp[i,1]*100,pch=19,col="green",cex=.5)
  }
  avg <- mean(data_temp[,2]/data_temp[,1]*100)
  lines(c(3.1,3.9),c(avg,avg),col="green",lwd=2)
  t_value <- t.test(data_naive[,2]/data_naive[,1],data_temp[,2]/data_temp[,1],alternative="l")
  if (t_value$p.value<.05) {
    lines(c(.5,3.5),c(90,90),col="black")
    points(2,91,pch=8,col="black",cex=.75)
  }
} else if (args[4]==3) {
  data_temp <- data_seq[data_seq[,7]==1,]
  for (i in 1:dim(data_temp)[1]) {
    points(2.5,data_temp[i,2]/data_temp[i,1]*100,pch=19,col="green",cex=.5)
  }
  avg <- mean(data_temp[,2]/data_temp[,1]*100)
  lines(c(2.1,2.9),c(avg,avg),col="green",lwd=2)
  t_value <- t.test(data_naive[,2]/data_naive[,1],data_temp[,2]/data_temp[,1],alternative="l")
  if (t_value$p.value<.05) {
    lines(c(.5,2.5),c(85,85),col="black")
    points(1.5,86,pch=8,col="black",cex=.75)
  }

  data_temp <- data_seq[data_seq[,7]==2,]
  for (i in 1:dim(data_temp)[1]) {
    points(3.5,data_temp[i,2]/data_temp[i,1]*100,pch=19,col="green",cex=.5)
  }
  avg <- mean(data_temp[,2]/data_temp[,1]*100)
  lines(c(3.1,3.9),c(avg,avg),col="green",lwd=2)
  t_value <- t.test(data_naive[,2]/data_naive[,1],data_temp[,2]/data_temp[,1],alternative="l")
  if (t_value$p.value<.05) {
    lines(c(.5,3.5),c(90,90),col="black")
    points(2,91,pch=8,col="black",cex=.75)
  }

  data_temp <- data_seq[data_seq[,7]==3,]
  for (i in 1:dim(data_temp)[1]) {
    points(4.5,data_temp[i,2]/data_temp[i,1]*100,pch=19,col="green",cex=.5)
  }
  avg <- mean(data_temp[,2]/data_temp[,1]*100)
  lines(c(4.1,4.9),c(avg,avg),col="green",lwd=2)
  t_value <- t.test(data_naive[,2]/data_naive[,1],data_temp[,2]/data_temp[,1],alternative="l")
  if (t_value$p.value<.05) {
    lines(c(.5,4.5),c(95,95),col="black")
    points(2.5,96,pch=8,col="black",cex=.75)
  }
}

# Plot unsequenced colony points and averages
avg <- mean(data_unseq[,2]/data_unseq[,1]*100)

if (args[4]==0) {
  for (i in 1:dim(data_unseq)[1]) {
    points(2.5,data_unseq[i,2]/data_unseq[i,1]*100,pch=19,col="gray",cex=.5)
  }
  lines(c(2.1,2.9),c(avg,avg),col="gray",lwd=2)
} else if (args[4]==1) {
  for (i in 1:dim(data_unseq)[1]) {
    points(3.5,data_unseq[i,2]/data_unseq[i,1]*100,pch=19,col="gray",cex=.5)
  }
  lines(c(3.1,3.9),c(avg,avg),col="gray",lwd=2)
} else if (args[4]==2) {
  for (i in 1:dim(data_unseq)[1]) {
    points(4.5,data_unseq[i,2]/data_unseq[i,1]*100,pch=19,col="gray",cex=.5)
  }
  lines(c(4.1,4.9),c(avg,avg),col="gray",lwd=2)
} else if (args[4]==3) {
  for (i in 1:dim(data_unseq)[1]) {
    points(5.5,data_unseq[i,2]/data_unseq[i,1]*100,pch=19,col="gray",cex=.5)
  }
  lines(c(5.1,5.9),c(avg,avg),col="gray",lwd=2)
}

dev.off()
