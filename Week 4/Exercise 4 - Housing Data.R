install.packages("readxl")
library(readxl)
library(tidyverse)
install.packages("plyr")
library(plyr)
library(pastecs)
setwd("~/GitHub/520VictoriaHall")
housing_data<-read_excel("data/week-7-housing.xlsx")
head(housing_data)
housing_data_df<-data.frame(housing_data) #setting as a dataframe
head(housing_data_df)
apply(housing_data_df,2,FUN = min) #Using apply function on dataset
apply(housing_data_df,2,FUN = max) #Using apply function on dataset
aggregate(Sale.Price ~ year_built,housing_data_df,mean) #Using aggregate function to find mean price by year
housing_data_df$year_built[housing_data_df$year_built < 1999]<- NA #subsetting data to just look at houses built 1999 and after
aggregate(Sale.Price ~ year_built,housing_data_df,mean) #Checking the subsetting worked
housing_data_df$pricepersqft<-with(housing_data_df,Sale.Price/sq_ft_lot) #Creating new variable 
housing_data_df$priceperbedroom<-with(housing_data_df,Sale.Price/bedrooms)#Creating new variable
tail(housing_data_df) #Checking new variable was added
ddply(housing_data_df, "year_built", summarise, mean.SqFtPrice = mean(pricepersqft)) #Using plyr
head(housing_data_df)
options(scipen=999) #Changing to prevent scientific notation
distplot<-ggplot(housing_data_df,aes(Sale.Price))+geom_histogram(bins=50)#Checking the distribution
distplot
stat.desc(housing_data_df$Sale.Price) #Identifying outliers- looking at min  and max compared to median/mean
housing_data_df$Sale.Price[housing_data_df$Sale.Price<1056529]<- NA #just look at prices < 2 SD away from mean in upper
distplot<-ggplot(housing_data_df,aes(Sale.Price))+geom_histogram(bins=50)#Checking the distribution
distplot
stat.desc(housing_data_df$Sale.Price) #looking at updated stats without top outliers
