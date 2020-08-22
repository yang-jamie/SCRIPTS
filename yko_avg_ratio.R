#!/usr/bin/Rscript
# Average all 3 time points 
# Created 5/18/2018

args = commandArgs(T)
file = args[1]
out1 = args[2]
out2 = args[3]
out3 = args[4]
out4 = args[5]
out5 = args[6]
out6 = args[7]
data <- read.delim(file,header=T,sep="\t")

H_avg = array(0,dim(data)[1])
E_avg = array(0,dim(data)[1])
G_avg = array(0,dim(data)[1])
H_sd = array(0,dim(data)[1])
E_sd = array(0,dim(data)[1])
G_sd = array(0,dim(data)[1])

for (row in 1:nrow(data)) {
  H_avg[row] <- mean(as.numeric(data[row,2:4]),na.rm=T)
  E_avg[row] <- mean(as.numeric(data[row,6:7]),na.rm=T)
  G_avg[row] <- mean(as.numeric(data[row,9:11]),na.rm=T)
  H_sd[row] <- sd(as.numeric(data[row,2:4]),na.rm=T)
  E_sd[row] <- sd(as.numeric(data[row,6:7]),na.rm=T)
  G_sd[row] <- sd(as.numeric(data[row,9:11]),na.rm=T)
}
write(H_avg,out1,sep="\n")
write(H_sd,out2,sep="\n")
write(E_avg,out3,sep="\n")
write(E_sd,out4,sep="\n")
write(G_avg,out5,sep="\n")
write(G_sd,out6,sep="\n")
