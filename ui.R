# Package (which generally comes preloaded).

library(shiny)
# Datasets

library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Page Title
    titlePanel(" US personal expenditures by year"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
    
        hr(),
      
        # Slidert
        sliderInput("slider", label = h3("Years Range"), min = 1940,step = 5, max = 1960, value = c(1940, 1960)),
        # Line
        hr(),
        # Information about the dataset
        helpText("This data set consists of United States personal expenditures (in billions of dollars) in the categories; food and tobacco, household operation, medical and health, personal care, and private education for the years 1940, 1945, 1950, 1955 and 1960. "),
      
        hr(),
        
        # Show the user how to use the silder
        img(src = "DragMouse.jpg", height = 180, width = 220)
        ),
   
      
    # Create a spot for the barplot
      mainPanel(
        # Main plot
        plotOutput("USPEplot"),
        hr(),
        # documentation
        h3("Documentation"),
        helpText("This shiny application allow you to see changes expenditure between two years by  draging the slider to the appropriate years. For example by moving the first slider to 1945 and the second slider to 1955, we can see that there is a slight changes in presonal expenditures related to Private education and personal care and a huge increase in expenditure related to Food and Tobacco "),
        hr(),
        # GitHub repository
        a("Source code - GitHub repoistory ", href = "http://www.rstudio.com/shiny")
       
      )
      
    )
  )
)