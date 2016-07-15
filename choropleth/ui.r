library(shiny)
library(choroplethr)
library(choroplethrMaps)
library(ggplot2)

df1 <- read.csv("zika_clean.csv")

names(df1) <- c("region","6","5","4","3","2")
df1 <- df1[c(1,6,5,4,3,2)]

shinyUI(fluidPage(

  sidebarLayout(
    sidebarPanel(
      
      sliderInput(inputId = "month",
                  label   = "Select month",
                  min     = 2,
                  max     = 6,
                  value   = 2),
    helpText("Data: CDC zika repo (https://github.com/cdcepi/zika)")),
    
    mainPanel(
      plotOutput("stateMap")
      
      
    )
  )
))