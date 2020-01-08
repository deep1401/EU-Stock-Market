#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(shiny)
library(ggplot2)

#Load the dataset
EuStockDF <- as.data.frame(EuStockMarkets)
#Define UI for the stock market app
ui <- fluidPage(
                titlePanel("Stock Trend"),
                sidebarLayout(
                  sidebarPanel(
                    
                    # Select type of trend to plot
                    selectInput(inputId = "type", label = strong("Trend index"),
                                choices = c("DAX","SMI","CAC","FTSE"),
                                selected = "DAX")
                  ),
                
                mainPanel(
                  plotOutput(outputId = "lineplot", height = "300px")
                )
)
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$lineplot <- renderPlot({plot(x=c(1:nrow(EuStockDF)) , y = EuStockDF$input$type,
   xlab = "Time", ylab = "Stocks")

     })
}

# Run the application 
shinyApp(ui = ui, server = server)

