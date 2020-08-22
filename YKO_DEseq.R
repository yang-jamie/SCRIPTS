library(DEseq2)
library(apeglm)

# Read in count matrix and coldata
count_matrix_stress_10 <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/count_matrix_stress_10", row.names=1)
coldata <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/coldata")

# Separate into heat and ethanol
count_heat <- count_matrix_stress_10[,c(1,2,3,7,9,11)]
count_EtOH <- count_matrix_stress_10[,c(4,5,6,8,10,12)]

coldata_heat <- coldata[c(1,2,3,7,9,11),c(1,2,4)]
coldata_EtOH <- coldata[c(4,5,6,8,10,12),c(1,2,4)]

$ Run DEseq on heat and ethanol samples
dds_heat <- DESeqDataSetFromMatrix(countData = count_heat, colData = coldata_heat, design= ~ pair + condition)
dds_EtOH <- DESeqDataSetFromMatrix(countData = count_EtOH, colData = coldata_EtOH, design= ~ pair + condition)

dds1_heat <- DESeq(dds_heat)
dds1_EtOH <- DESeq(dds_EtOH)

resultsNames(dds1_heat)
resultsNames(dds1_EtOH)

res_heat <- results(dds1_heat, name="condition_pre_vs_post", alpha=0.05)
res_EtOH <- results(dds1_EtOH, name="condition_pre_vs_post", alpha=0.05)

resLFC_heat <- lfcShrink(dds1_heat, coef="condition_pre_vs_post", type="apeglm")
resLFC_EtOH <- lfcShrink(dds1_EtOH, coef="condition_pre_vs_post", type="apeglm")

resOrdered_heat <- resLFC_heat[order(resLFC_heat$pvalue),]
resOrdered_EtOH <- resLFC_EtOH[order(resLFC_EtOH$pvalue),]

plotMA(res_heat)
plotMA(res_EtOH)

plotMA(resLFC_heat)
plotMA(resLFC_EtOH)

plotMA(resLFC_heat,ylim=c(-3,12))
plotMA(resLFC_EtOH,ylim=c(-7,5))

write.table(as.data.frame(resLFC_heat),file="~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_heat", sep="\t", quote=F)
write.table(as.data.frame(resLFC_EtOH),file="~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH", sep="\t", quote=F)

resLFC_heat <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_heat")
resLFC_EtOH <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH")

# Plot ribosome and translation points on the MA plot
GO_heat_ribosome <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_heat_ribosome", row.names=1, header=F)
GO_heat_translation <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_heat_translation", row.names=1, header=F)
GO_EtOH_ribosome <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH_ribosome", row.names=1, header=F)
GO_EtOH_translation <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH_translation", row.names=1, header=F)
GO_EtOH_vacuole <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH_vacuole", row.names=1, header=F)
GO_EtOH_other_up <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH_other_up", row.names=1, header=F)
GO_EtOH_other_dn <- read.delim("~/Documents/PhD/Saeed_Tavazoie/rapamycin_project/sequencing_3-23-18/DEseq_EtOH_other_dn", row.names=1, header=F)

plot(resLFC_EtOH$baseMean,resLFC_EtOH$log2FoldChange,log='x',pch=19,cex=.5,col="gray",xlab="mean of normalized counts",ylab="log fold change",cex.lab=1.5,cex.axis=1.3)
points(GO_EtOH_ribosome[GO_EtOH_ribosome[,2]>0,1],GO_EtOH_ribosome[GO_EtOH_ribosome[,2]>0,2],pch=19,cex=.6,col="orange")
points(GO_EtOH_translation[GO_EtOH_translation[,2]>0,1],GO_EtOH_translation[GO_EtOH_translation[,2]>0,2],pch=19,cex=.6,col="purple")
points(GO_EtOH_other_up[,1],GO_EtOH_other_up[,2],pch=19,cex=.6,col="green")
legend(1000000,5,legend=c("ribosome","translation","other"),col=c("orange","purple","green"),cex=1.5,pch=19)

plot(resLFC_EtOH$baseMean,resLFC_EtOH$log2FoldChange,log='x',pch=19,cex=.5,col="gray",xlab="mean of normalized counts",ylab="log fold change",cex.lab=1.5,cex.axis=1.3)
points(GO_EtOH_vacuole[GO_EtOH_vacuole[,2]<0,1],GO_EtOH_vacuole[GO_EtOH_vacuole[,2]<0,2],pch=19,cex=.6,col="blue")
points(GO_EtOH_other_dn[,1],GO_EtOH_other_dn[,2],pch=19,cex=.6,col="red")
legend(1000000,5,legend=c("vacuole","other"),col=c("blue","red"),cex=1.5,pch=19)

plot(resLFC_heat$baseMean,resLFC_heat$log2FoldChange,log='x',pch=19,cex=.3,col="gray",xlab="mean of normalized counts",ylab="log fold change")
points(GO_heat_ribosome[GO_heat_ribosome[,2]>0,1],GO_heat_ribosome[GO_heat_ribosome[,2]>0,2],pch=19,cex=.3,col="orange")
points(GO_heat_translation[GO_heat_translation[,2]>0,1],GO_heat_translation[GO_heat_translation[,2]>0,2],pch=19,cex=.3,col="purple")
