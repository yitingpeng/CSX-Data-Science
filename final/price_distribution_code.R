Sys.setlocale(category = "LC_ALL", locale ="ENGLISH")
#read the data from steamspy
steamdata<-c()
for(year in 2012:2017){
  temp<-paste0(year,' - Year Stats - SteamSpy - All the data and stats about Steam games.csv')
  steamdata<-rbind(steamdata,read.csv(temp))
  }
steamdata$Price<-gsub("Free","0",steamdata$Price)
steamdata$Price<-gsub("^[[:punct:]]","",steamdata$Price)
steamdata$Price<-as.numeric(steamdata$Price)
#min/Q1/Q2/mean/Q3/max/
summary(steamdata$Price)

library(Hmisc)
describe(steamdata$Price) 
# n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles 
# 5 lowest and 5 highest scores

library(ggplot2)
#raw data
g<-ggplot(steamdata,aes(steamdata$Price))+
  geom_density()
g

q<-ggplot(steamdata,aes(x=steamdata$Price))+
  geom_histogram(fill = "steelblue2", color="black",binwidth = 5)+
  labs(x = "Sale Price($)")
q

#clean outliers
scale_data <- scale(steamdata$Price, center = TRUE, scale = TRUE)
steamdata<-cbind(steamdata,scale_data)
steamdata_c<-subset(steamdata,steamdata$scale_data<3)
steamdata_c<-subset(steamdata_c,steamdata$scale_data>-3)

#after cleaning outliers
g_c<-ggplot(steamdata_c,aes(steamdata_c$Price))+
  geom_density()
g_c

q_c<-ggplot(steamdata_c,aes(x=steamdata_c$Price))+
  geom_histogram(fill = "steelblue2", color="black",binwidth = 5)+
  labs(x = "Sale Price($)")
q_c
