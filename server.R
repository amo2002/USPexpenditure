library(shiny)


# Needed Package 
library(ggplot2)

data <- as.data.frame(USPersonalExpenditure) # data from package datasets
data$Category <- as.character(rownames(USPersonalExpenditure)) # this makes things simpler later
data$Year <- as.character(colnames(USPersonalExpenditure)) # this makes things simpler later

# Define a server for the Shiny app
shinyServer(function(input, output) {

  
  output$USPEplot <- renderPlot({
    # Check for return value from the slider and replace to the related column
    if ( input$slider[1]==1940) colx<-1  
    if ( input$slider[1]==1945) colx<-2 
    if ( input$slider[1]==1950) colx<-3 
    if ( input$slider[1]==1955) colx<-4 
    if ( input$slider[1]==1960) colx<-5 
    
    if ( input$slider[2]==1940) coly<-1  
    if ( input$slider[2]==1945) coly<-2 
    if ( input$slider[2]==1950) coly<-3 
    if ( input$slider[2]==1955) coly<-4 
    if ( input$slider[2]==1960) coly<-5 
    
    
    # Fill in the spot we created for a plot
    
        ggplot(data,
           aes(y = Category)) +
      labs(x = "Expenditure",
           y = "Category") +
      geom_segment(aes(x = data[,colx],
                       y = Category,
                       xend = data[,coly],
                       yend = Category),
                   size = 1) +
      
      geom_point(aes(x = data[,colx],
                     color = data$Year[colx]),
                 size = 4, shape = 15) +
      geom_point(aes(x = data[,coly],
                     color = data$Year[coly]),
                 size = 4, shape = 15) +
      
      scale_color_discrete(name = "Year") +
      theme(legend.position = "bottom")
      
  })
})