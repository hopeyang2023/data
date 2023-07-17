rm(list=ls())
setwd("/Users/yangjianxia/Documents/code_data/Fig.2/ab")
library(ggplot2)
library(colorRamps)
library(gtable)
library(dplyr)
library(agricolae)
library(nlme)
library(vegan)
library(psych)
library(igraph)
library(tidyr)
library(MuMIn)
da<-read.csv("Relation.csv",row.names = 1)
da$LN<-log(da$Nlevel+1)
da$Nadd <- factor(da$Nadd, levels = c("Ncess", "Ncont"))
p1<-ggplot(da,aes(x=LN,y=lgt,colour=Nadd))+
  geom_smooth(data=da,aes(x=LN, y=lgt), method = "lm", color = "black",linewidth=2)+
  geom_jitter(height = 0, alpha = 0.5, size =20) + 
  scale_shape_manual(values=c(16,16))+
  scale_colour_manual(values=c("blue","red"),
                      labels=c(expression(N[cess]),expression(N[cont])))+
  xlab(bquote(Log[10]~(N~levels)~(g~N~m^-2~yr^-1))) +
  ylab(bquote('The number of HGT events'))+
  guides(colour=guide_legend(title = expression(N[add])))+theme_bw()+
  theme(text=element_text(size=40,  family="sans"))+
  theme(legend.title = element_text(colour="black", size=40),
        legend.text = element_text(colour="black", size=40),
        axis.text=element_text(colour="black",size=35),
        axis.title=element_text(colour="black",size=40))
p1<-p1+theme(panel.border = element_rect(fill = NA,color = "black",size=3.5,linetype = "solid"))
p1
ggsave("fig2a.pdf",width = 14.26,height = 13.26)


####lgt中ko的多样性
p2<-ggplot(da,aes(x=LN,y=lgtko,colour=Nadd))+
  geom_smooth(data=da,aes(x=LN, y=lgtko), method = "lm", color = "black",linewidth=2)+
  geom_jitter(height = 0, alpha = 0.5, size =20) + 
  scale_shape_manual(values=c(16,16))+
  scale_colour_manual(values=c("blue","red"),
                      labels=c(expression(N[cess]),expression(N[cont])))+
  xlab(bquote(Log[10]~(N~levels)~(g~N~m^-2~yr^-1))) +
  ylab(bquote('The richness of horizontally transferred genes'))+
  guides(colour=guide_legend(title = expression(N[add])))+theme_bw()+
  theme(text=element_text(size=40,  family="sans"))+
  theme(legend.title = element_text(colour="black", size=40),
        legend.text = element_text(colour="black", size=40),
        axis.text=element_text(colour="black",size=35),
        axis.title=element_text(colour="black",size=40))
p2<-p2+theme(panel.border = element_rect(fill = NA,color = "black",size=3.5,linetype = "solid"))
p2
ggsave("fig2b.pdf",width = 14.26,height = 13.26)


