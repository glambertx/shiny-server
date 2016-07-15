library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  # Application title
  sidebarPanel(
  
    selectizeInput("name",
                   label = "Select U.S. Teritory or State",
                   choices = unique(ideal$location),
                   multiple = T,
                   options = list(maxItems = 8, placeholder = 'Select a name'),
                   selected = c("California", "New_York")),
    selectizeInput("type",
                   label = "Select Local or Travel Event",
                   choices = unique(ideal$data_field),
                   multiple = T,
                   options = list(maxItems = 1, placeholder = 'Select an event'),
                   selected = c("zika_reported_travel")),
    # Term plot
    helpText("Data: CDC zika repo (https://github.com/cdcepi/zika)")),
  # Show a plot of the generated distribution
  mainPanel(
    plotlyOutput("trendPlot")
  )
)
)
