library(shiny)

# Rely on the 'USPersonalExpenditure' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
USPersonalExpenditure <- t(USPersonalExpenditure)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$expenditurePlot <- renderPlot({
    
    # Render a barplot
    barplot(USPersonalExpenditure[,input$category], 
            main=input$category,
            ylab="Billions of Dollars",
            xlab="Year")
  })
})