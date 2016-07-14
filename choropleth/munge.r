library(choroplethr)
library(data.table)
library(choroplethrMaps)
library(plyr)
library(dplyr)
library(tidyr)

zika <- read.csv("Data/zika_states.csv")
zika$location <- gsub("United_States-","",zika$location)
zika$location <- as.character(zika$location)
zika$location <- gsub("_"," ",zika$location)

## remove teritories

zika <- zika[zika$location_type == "state",]

## subset only travel observations
zika <- zika[zika$data_field == "zika_reported_travel",]


region_name = c(state.name, "District of Columbia")

# change location to lowercase
zika$location <- tolower(zika$location)

#Choroplethr expects a column named 'region' for the state and a column named 'value' for the values to be represented
zika <- rename(zika, location=region)
zika <- zika[,c("region","value","report_date")]

# convert dates 
zika$report_date <- as.Date(zika$report_date, format = "%m/%d/%Y")

# create month column
zika2 <- zika %>%  mutate(month = format(report_date, "%m")) 

# subset data taking max value for each month of each state
zika2$month <- as.numeric(zika2$month)
zika2 <- zika2 %>% group_by(month,location) %>% filter(value == max(value)) %>% filter(row_number(value) == 1)

# subset
zika2 <- zika2[,c("location","month","value")]

zika2$month <- as.factor(zika2$month)
zika2$location <- as.factor(zika2$location)
zika2 <- as.data.frame(zika2)

zika2 <- reshape(zika2, idvar='location', timevar='month', direction='wide')

zika2[is.na(zika2)] <- 0
names(zika2) <- c("location","6","5","4","3","2")
#names(zika2) <- c("location","Febuary","March","April","May","June")
zika2$location <- as.character(zika2$location)
zika2$`6` <- as.numeric(zika2$`6`)
save(zika2, file="zika_clean.RData")

write.csv(file="zika_clean.csv", zika2,row.names=F)


