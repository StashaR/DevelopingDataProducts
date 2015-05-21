library(shiny)

# Rely on the 'USPersonalExpenditure' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
USPersonalExpenditure <- t(USPersonalExpenditure)

# Define the overall UI and the Panels
shinyUI(
  navbarPage("US Personal Expenditure Explorer",
  tabPanel("Plot",
  
    # Use a fluid Bootstrap layout
    fluidPage(    
    
     # Give the page a title
      titlePanel("Personal Expenditure by Category"),
    
      # Generate a row with a sidebar
      sidebarLayout(      
      
        # Define the sidebar with one input
        sidebarPanel(
          selectInput("category", "Category:", 
                      choices=colnames(USPersonalExpenditure)),
          hr(),
          helpText("Data from The World Almanac and Book of Facts, 1962, page 756.")
        ),
      
        # Create a spot for the barplot
        mainPanel(
          plotOutput("expenditurePlot")  
        )
      
      )
    )
  ),
  
  tabPanel("Documentation",
           mainPanel(
             helpText(
            "This tool creates an interactive interface to explore US Personal Expenditures (in billions of dollars) in various categories for the years 1940, 1945, 1950, 1955, and 1960. To use, select your category of interest from the dropdown menu to view the plot of US Personal Expenditures specific to that category. Data is from The World Almanac and Book of Facts, 1962, page 756."
           ))
  )
))