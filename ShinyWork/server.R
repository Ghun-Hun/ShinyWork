
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(quantmod)

#indicator list
mastring<-c("addEMA(n=5)","addEMA(n=20)","addEMA(n=60)")
tastring<-c("addMACD()","addWPR()","addRSI()")

shinyServer(function(input, output) {
  # add indicator 
  ta<-reactive({
    baseta<-"addVo()"
    ma<-paste(mastring[as.numeric(input$ma)],collapse=";")
    baseta<-paste(baseta,ma,sep=";")
    baseta<-paste0(tastring[as.numeric(input$ta)],";",baseta)
  })
  # get stock data from yahoo finance  
  datainput<-reactive({
    symbol_env <- new.env()
    stock <- require_symbol(input$ID_text,input$dates[1],input$dates[2],symbol_env)
  })
  #plot stock chart
  output$Plot <- renderPlot({
    
    chartSeries(datainput(),theme="white",type ="candlesticks", TA=ta()) 
    
  })

})
# get stock data function
require_symbol <- function(symbol,start,end,envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol,from =start,to =end,auto.assign = FALSE)
  }
  
  envir[[symbol]]
}

