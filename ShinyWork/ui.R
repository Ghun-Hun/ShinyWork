
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(quantmod)

shinyUI(fluidPage(

  # Application title
  titlePanel("Stock Trend Chart"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("ID_text", 
                label = h4("Stock Symbol"), 
                value = "AAPL"),
      helpText("You can find symbol in yahoo finance."),
      dateRangeInput("dates", 
                     label = h4("Date range"),
                     start="2010-01-01",
                     end="2012-01-01"),
      helpText("Select date range for you demand."),
      checkboxGroupInput("ma", label = h4("Moving Average Line "), 
                         choices = list("5 day" = 1, "20 day" = 2, "60 day" = 3),
                         selected = 1),
      selectInput("ta", label = h4("Indicator"), 
                  choices = list("MACD" = 1, "WMI" = 2, "RSI" = 3), 
                  selected = 1),
      helpText("Select indicator for you demand"),
      width=3
     
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel(
          "plot",plotOutput("Plot",, width = "100%", height = "500px")
        )
        tabPanel(
          "Docum"
        )
      ),
      width = 9
    )
  )
))
