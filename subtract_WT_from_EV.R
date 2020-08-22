#!/usr/bin/Rscript
# Subtract one matrix from another

args = commandArgs(T)
file1 = args[1]
data_WT <- read.table(file1,header=T,sep="\t",row.names=1)
file2 = args[2]
data_EV <- read.table(file2,header=T,sep="\t",row.names=1)
data.matrix(data_WT, rownames.force = NA)
data.matrix(data_EV, rownames.force = NA)

# Subtract WT from EV
data_diff <- data_EV - data_WT

# Print final resulting matrix
write.table(data_diff,file=args[3],sep="\t",row.names=T,quote=F)
