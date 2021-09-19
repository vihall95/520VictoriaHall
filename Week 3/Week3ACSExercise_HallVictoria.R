#Victoria Hall
#DSC520-T302
#Week 3 Exercise 3.2
#9.16.2021

install.packages("tidyverse")
install.packages("pastecs")
install.packages("RNHANES")
install.packages("moments")
library(moments)
library(pastecs)
library(RNHANES)
library(ggplot2)
setwd("~/GitHub/520VictoriaHall")
acs2014_df <- read.csv("data/acs-14-1yr-s0201.csv")
str(acs2014_df)
names(acs2014_df)
nrow(acs2014_df)
ncol(acs2014_df)
1 + (3.322* log(136)) # # of bins
acs_hist<-ggplot(acs2014_df,aes(HSDegree))+geom_histogram(bins=17)+ggtitle("High School Degree Completion")+ylab("# of Populations")+xlab("% Earned Highschool Degree")
acs_hist_density<- ggplot(acs2014_df,aes(HSDegree))+geom_histogram(aes(y = ..density..),bins = 17)+ggtitle("High School Degree Completion")+ylab("# of Populations")+xlab("% Earned Highschool Degree")
acs_hist_density+stat_function(fun=dnorm,args = list(mean = mean(acs2014_df$HSDegree),sd=sd(acs2014_df$HSDegree)),col = "Red",size = 2)
ggplot(acs2014_df,aes(sample=HSDegree))+stat_qq()+stat_qq_line()
stat.desc(cbind(acs2014_df$HSDegree), basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
degree_vector <- c(acs2014_df$HSDegree)
z_score_degree<-(degree_vector-mean(degree_vector))/sd(degree_vector)
z_score_degree
plot(z_score_degree, type="o")
kurtosis(degree_vector)
