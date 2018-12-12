Sys.setlocale(category = "LC_ALL", locale ="ENGLISH")
#read the data from steamspy
steamdata<-c()
for(year in 2012:2017){
  temp<-paste0('steam_',year,'.csv')
  steamdata<-rbind(steamdata,read.csv(temp))
}

steamdata$X.<-NULL
steamdata$Score.rank.Userscore...Metascore.<-NULL

steamdata$Price<-gsub("Free","0",steamdata$Price)
steamdata$Price<-gsub("^[[:punct:]]","",steamdata$Price)
steamdata$Price<-as.numeric(steamdata$Price)
steamdata$Owners<-gsub("Â","",steamdata$Owners)
steamdata$Owners<-gsub("[[:blank:]]","",steamdata$Owners)

#owners
levels(steamdata$Owners)
#level_change
cat<-c(1:13)
level<-c("0..20,000","20,000..50,000","50,000..100,000","100,000..200,000",
         "200,000..500,000","500,000..1,000,000","1,000,000..2,000,000",
         "2,000,000..5,000,000","5,000,000..10,000,000","10,000,000..20,000,000" ,
         "20,000,000..50,000,000","50,000,000..100,000,000","100,000,000..200,000,000")
level<-factor(level,levels= c("0..20,000","20,000..50,000","50,000..100,000","100,000..200,000",
                              "200,000..500,000","500,000..1,000,000","1,000,000..2,000,000",
                              "2,000,000..5,000,000","5,000,000..10,000,000","10,000,000..20,000,000" ,
                              "20,000,000..50,000,000","50,000,000..100,000,000","100,000,000..200,000,000"))
levels(level)
steamdata$owners_lab<-factor(steamdata$Owners,levels = levels(level),labels =cat)
steamdata$Owners<-NULL
#release.date
install.packages("lubridate")
library("lubridate")
steamdata$year<-steamdata$Release.date
steamdata$year<-as.character(steamdata$year)
steamdata$year<-parse_date_time(steamdata$year,orders = c("mdy","my"))
steamdata$year<-year(steamdata$year)
steamdata$Release.date<-NULL

write.csv(steamdata, file = "steam_basic.csv")
