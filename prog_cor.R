#!/usr/bin/Rscript
# Determine all genes with positive correlation with time
# Created 5/1/2018

args = commandArgs(T)
file = args[1]
data <- read.table(file,header=T,sep="\t")
data2 <- data[,4:7]
time <- c(15,30,60)
ans = array(0,dim(data)[1])

for (row in 1:nrow(data2)) {
  ans[row] <- cor(time,as.numeric(data2[row,]),method="spearman")
  print(ans[row])
}
