setwd("G:/data1")
loks<-read.csv("longley.csv")
View(loks)

model1<-lm(Employed~.,data=loks)
summary(model1)

model2<-lm(Employed~.-Year,data=loks)
summary(model2)

loki<-loks[,-8]
View(loki)
pc<-prcomp(loki,center = TRUE,scale. = TRUE)
 
 summary(pc)

lokibind<-cbind(loks[,8],data.frame(pc$x))

View(lokibind)
loks[,8]="newlokdata"
colnames(lokibind)[1]="newlok"#assingning name to a column

loongleypcs<-lm(newlok~.,data = lokibind)

abline(loongleypcs)
#proportion of variance will give coverage of the data set 

library(psych)
