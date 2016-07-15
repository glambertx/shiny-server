
library(plotly)
pdf(NULL)
shinyServer(function(input, output, session) {
  
  output$trendPlot <- renderPlotly({
    
    if (length(input$name) == 0) {
      print("Please select at least one region")
    } else {
      df_trend <- ideal[ideal$location == input$name &  ideal$data_field == input$type, ]
      ggplot(df_trend) +
        geom_line(aes(x = report_date, y = value, by = location, color = location))+
        labs(x = "", y = "Cases", title = "Zika 2016") +
        scale_colour_hue("location", l = 70, c = 150) + ggthemes::theme_few()
    }
    
  })
})
