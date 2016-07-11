library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Zika Cases"),
  sidebarPanel(
  
    selectizeInput("name",
                   label = "Select US Teritory or State",
                   choices = unique(ideal$location),
                   multiple = T,
                   options = list(maxItems = 8, placeholder = 'Select a name'),
                   selected = c("New_York","Florida")),
    selectizeInput("type",
                   label = "Select Local or Travel Event",
                   choices = unique(ideal$data_field),
                   multiple = T,
                   options = list(maxItems = 1, placeholder = 'Select an event'),
                   selected = c("zika_reported_travel")),
    # Term plot
    plotOutput("termPlot", height = 50),
    helpText("Data: ")
  ),
  # Show a plot of the generated distribution
  mainPanel(
    plotlyOutput("trendPlot")
  )
)
)