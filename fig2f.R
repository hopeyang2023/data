setwd("/Users/yangjianxia/Documents/code_data/Fig.2/f")
rm(list=ls())
data<-read.csv("up.csv",header = T,row.names = 1)
data$Annotation<-factor(data$Annotation,levels=c("Stilbenoid.diarylheptanoid.and.gingerol.biosynthesis",
                                                 "Biosynthesis.of.type.II.polyketide.products",
                                                 "Biosynthesis.of.enediyne.antibiotics",
                                                 "Glycosphingolipid.biosynthesis",
                                                 "Flavonoid.biosynthesis",
                                                 "Staurosporine.biosynthesis",
                                                 "Steroid.hormone.biosynthesis",
                                                 "Tetracycline.biosynthesis","Arginine.biosynthesis",
                                                 "Sphingolipid.metabolism","Phagosome",
                                                 "Biofilm.formation"),ordered = T)
data$Annotation<-factor(data$Annotation,
                        labels=c("Stilbenoid diarylheptanoid \
                                 and gingerol biosynthesis",
                                 "Biosynthesis of type II \
                      polyketide products",
                                 "Biosynthesis of enediyne antibiotics",
                                 "Glycosphingolipid biosynthesis",
                                 "Flavonoid biosynthesis",
                                 "Staurosporine biosynthesis",
                                 "Steroid hormone biosynthesis",
                                 "Tetracycline biosynthesis","Arginine biosynthesis",
                                 "Sphingolipid metabolism","Phagosome",
                                 "Biofilm formation"),ordered = T)
data$Annotation
library(patchwork)
##上调
library(ggplot2)
p1<-ggplot(data, aes(x=ratio, y=Annotation,colour=group,shape=sig)) +
  geom_point(alpha = 0.5,size=15)+
  scale_shape_manual(values = c(1,16))+
  scale_colour_manual(values = c("blue","red"),
                      labels=c(expression(N[cess]),expression(N[cont])))+
  theme_bw()+
  geom_vline(aes(xintercept=1),colour="Black",size=3.5,linetype="dashed")+
  xlab("Enrichment ratio")+
  ylab(" ")+
  guides(colour=guide_legend(title = expression(N[add])))+
  theme(text=element_text(size=35,  family="sans"))+
  theme(axis.text.x=element_text(size=35,color="black"), 
        axis.text.y=element_text(size=35,color="black"), 
        axis.title=element_text(size=35,color="black"))+
  xlim(-1, 8)  +
  #theme(text=element_text(size=11,  family="sans", face="bold"))+
  theme(legend.position = 'top', 
        legend.direction = "horizontal")
p1<-p1+theme(panel.border = element_rect(fill = NA,color = "black",size=3.5,linetype = "solid"))
p1
ggsave("up.pdf",width = 23.28,height=17.68)
