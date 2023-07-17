rm(list=ls())
setwd("/Users/yangjianxia/Documents/code_data/Fig.2/c")
library(pheatmap)
data <- read.csv("allko.csv",header = T,row.names = 1)
group <- read.csv("group.csv",header = T,row.names = 1)
ann_colors = list(Nadd=c(Ncont="red",Ncess="blue"),
                  Nlevel=c(N0="darkgrey",N2="chartreuse",N5="deepskyblue",
                           N10="darkviolet",N15="darkorange",N20="#CC0033",
                           N50="darkgoldenrod"))
#pdf('modul_all1.pdf', height =15, width = 15)
pheatmap(data,scale="row",fontsize=10,
         annotation_col = group,
         show_rownames=F,
         cluster_cols=F,cluster_rows=F,
         annotation_colors = ann_colors,cutree_rows=3,
         border=FALSE,
         color = colorRampPalette(c("#fcee21","white","#8d0f82"))(100))
pdf('modul_all1.pdf', height =15, width = 15)
