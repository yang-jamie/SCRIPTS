#!/usr/bin/Rscript
# Plot average expression change over various timepoints
# Created 9/28/2018

# 1. protein kinase activity
# 2. ribosome
# 3. bud
# 4. cell communication
# 5. 43S/48S (pre)initation complex
# 6. phosphotransferase activity, alcohol group as acceptor
# 8. spore
# A. RNA pol II transcription
# B. signal transduction
# C. positive regulation

args = commandArgs(T)
file1 = args[1]
data1 <- read.table(file1,header=F,sep="\t",fill=T)
file2 = args[2]
data2 <- read.table(file2,header=F,sep="\t",fill=T)
file3 = args[3]
data3 <- read.table(file3,header=F,sep="\t",fill=T)
file4 = args[4]
data4 <- read.table(file4,header=F,sep="\t",fill=T)
file5 = args[5]
data5 <- read.table(file5,header=F,sep="\t",fill=T)
file6 = args[6]
data6 <- read.table(file6,header=F,sep="\t",fill=T)
file7 = args[7]
data7 <- read.table(file7,header=F,sep="\t",fill=T)
file8 = args[8]
data8 <- read.table(file8,header=F,sep="\t",fill=T)
file9 = args[9]
data9 <- read.table(file9,header=F,sep="\t",fill=T)
file10 = args[10]
data10 <- read.table(file10,header=F,sep="\t",fill=T)

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

# Print each to a new file
new_vector <- rbind(vector1,vector2,vector3,vector4,vector5,vector6,vector7,vector8,vector9,vector10)
row.names(new_vector) <- c("kinase activity","ribosomal protein","cellular bud","cell communication","translation preinitation/initation complex","phosphotransferase activity","spore wall assembly","RNA pol II","signal transduction","positive regulation")
write.table(new_vector,file="/media/data4/jamie/180422_NS500277_0322_AHVWNJBGX5/Data/Intensities/BaseCalls/trimmomatic/EV_GO_graphs/FINAL_EV",sep="\t",row.names=T,quote=F,col.names=F)

#
#png(args[12])
#plot(x_vector,vector1,ylab="Average expression change",xlab="Time (min)",pch=19,ylim=c(-2.5,1))
#lines(x_vector,vector1)
#par(new = TRUE)
#plot(x_vector,vector2,pch=19)
#lines(x_vector,vector2)
#par(new = TRUE)
#plot(x_vector,vector3,pch=19)
#lines(x_vector,vector3)
#par(new = TRUE)
#plot(x_vector,vector4,pch=19)
#lines(x_vector,vector4)
#par(new = TRUE)
#plot(x_vector,vector5,pch=19)
#lines(x_vector,vector5)
#par(new = TRUE)
#plot(x_vector,vector6,pch=19)
#lines(x_vector,vector6)
#par(new = TRUE)
#plot(x_vector,vector7,pch=19)
#lines(x_vector,vector7)
#par(new = TRUE)
#plot(x_vector,vector8,pch=19)
#lines(x_vector,vector8)
#par(new = TRUE)
#plot(x_vector,vector9,pch=19)
#lines(x_vector,vector9)
#par(new = TRUE)
#plot(x_vector,vector10,pch=19)
#lines(x_vector,vector10)
#par(new = TRUE)
#plot(x_vector,vector11,pch=19)
#lines(x_vector,vector11)
#dev.off()
