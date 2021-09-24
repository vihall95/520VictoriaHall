#Victoria Hall
#Exercise 4
#9.24.2021
#DSC520



library(pastecs)
library(tidyverse)
library(ggplot2)
install.packages("car")
library(car)
setwd("~/GitHub/520VictoriaHall")
scores<-read.csv("data/scores.csv")
head(scores)
scoresdf<-data.frame(scores)
scoresdf
regData<- subset(scoresdf,Section=="Regular")
sportsData<-subset(scoresdf,Section=="Sports")
regData
sportsData
regPlot<-ggplot(regData,aes(Score,Count))+geom_col()+labs(title="Regular Section",x= "Scores", y ="# of People Scored")
regPlot
sportPlot<-ggplot(sportsData,aes(Score,Count))+geom_col()+labs(title="Sports Section",x= "Scores", y ="# of People")
sportPlot
stat.desc(regData,norm = TRUE)
stat.desc(sportsData,norm = TRUE)
