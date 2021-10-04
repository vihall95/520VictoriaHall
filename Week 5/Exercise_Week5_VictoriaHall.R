#Victoria Hall
#DSC520-T302
#Week 5
#10.4.2021



install.packages("dplyr")
install.packages("magrittr")
install.packages("purrr")
library(readxl)
library(tidyverse)
library(plyr)
library(dplyr)
library(pastecs)
library(magrittr)
library(purrr)
library(stringr)



setwd("~/GitHub/520VictoriaHall") #Setting directory
housing_data<-read_excel("data/week-7-housing.xlsx") #Reading in Housing Data
head(housing_data)
housing_data_df<-data.frame(housing_data) #setting as a dataframe
head(housing_data_df)
price_bysize<-select(housing_data_df,Sale.Price, square_feet_total_living, bedrooms, bath_full_count) #setting selection as variable
price_bysize %>% filter(Sale.Price >500000) #Using filter with pipe to pull houses that sold greater than 500k
str(housing_data_df) #double checking types before mutating
housing_data_df<-housing_data_df %>% select(Sale.Price,square_feet_total_living,bedrooms,bath_full_count) %>% mutate(PricePerSquareFoot=Sale.Price/square_feet_total_living) #adding price per square foot
housing_data_df %>% summarize(AvgPrice=mean(Sale.Price),MedianPrice=median(Sale.Price),AvgPricePerSqFoot=mean(PricePerSquareFoot),MedianPricePerSqFoot=median(PricePerSquareFoot))
housing_data_df %>% dplyr::group_by(bedrooms) %>% dplyr::summarize(AvgPrice=mean(Sale.Price)) #Calling package because it wasn't pulling correctly
housing_data_df %>% dplyr::group_by(bedrooms) %>% dplyr::summarize(AvgPrice=mean(Sale.Price)) %>% arrange(AvgPrice) #Arranging by lowest price to highest avg. price
housing_data_df %>% map(sum) #Summing each column
housing_data_df %>% compact() %>% arrange(Sale.Price) #Removing Null, len 0
housing_data_df<-data.frame(housing_data) #adjusting back to full frame of data
head(housing_data_df)
sales_informationhighprice<-housing_data_df %>% select(Sale.Price,Sale.Date,sale_reason,sale_instrument) %>% filter(Sale.Price>1000000) #creating to use Rbind
sales_informationlowprice<- housing_data_df %>% select(Sale.Price,Sale.Date,sale_reason,sale_instrument) %>% filter(Sale.Price<600000) #creating to use Rbind
sales_informationall<-housing_data_df %>% select(Sale.Price,Sale.Date,sale_reason,sale_instrument) #Creating to CBind
home_information<-housing_data_df %>% select(square_feet_total_living, bedrooms, bath_full_count,year_built) #Creating to use CBind
rbind(sales_informationhighprice,sales_informationlowprice) #Combining by row
cbind(sales_informationall,home_information) #Combining by column
salesyear<- str_split(string=housing_data_df$Sale.Date,pattern= "-") #Splitting date by -
salesyear
salesyear_reformat<- paste(salesyear) #Concatenating date string after split
salesyear_reformat
