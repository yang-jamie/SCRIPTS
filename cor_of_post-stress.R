#!/usr/bin/Rscript
# Cor of all post-stress time points
# Created 6/17/2018

args = commandArgs(T)
file = args[1]
data <- read.table(file,header=T,sep="\t")
data2 <- data[,4:7]
time=c(15,30,60)
ans = array(0,dim(data)[1])

for (row in 1:nrow(data2)) {
  ans[row] <- cor(time,as.numeric(data2[row,]),method="spearman")
  print(ans[row])
}

print(hist(ans))
