ideal <- read.csv("zika.csv", stringsAsFactors = F)
ideal$location <- gsub("United_States-","",ideal$location)

ideal$report_date <- as.Date(ideal$report_date, format = "%m/%d/%y")
ideal$report_date2 <- as.numeric(ideal$report_date)

#ideal <- ideal[ideal$data_field_code == "US0001",]


