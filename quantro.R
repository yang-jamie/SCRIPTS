#!/usr/bin/Rscript
# Created 7/5/2018
# Use quantro

library(quantro)
library(minfi)
library(doParallel)

# Save as matrix format
p <- as.matrix(table_final_filter1)

# Save matrix as q so that colnames can be changed without altering original
q <- p
colnames(q) <- # sort by different groups to compare

# Run quantro
qtest <- quantro(q,colnames(q))
summary(qtest)
anova(qtest)

# If betweeen is much greater than within, global normalization is not that way to go
# MSbetween is mean squared error between groups
# MSwithin is mean squared error within groups
# quantroStat is a ratio of MSbetween to MSwithin
MSbetween(qtest)
MSwithin(qtest)
quantroStat(qtest)

# Assessing the statistical significance
registerDoParallel(cores=1)
qtestPerm <- quantro(q,colnames(q),B=1000)
qtestPerm
