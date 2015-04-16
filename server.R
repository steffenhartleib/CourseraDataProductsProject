#ShinyServerProject server.R

library(shiny)
#function:
totAdvBudget <- function(t,r) t + r
predUnits <- function(t,r) 2.92110 + t* 0.04575 + r*0.18799
predRev <- function(t,r,m) (2.92110 + t* 0.04575 + r*0.18799) * m
predProf <- function(t,r,m,c) (2.92110 + t* 0.04575 + r*0.18799) * (m-c) -t -r

shinyServer(function(input, output) {
    #output$inputValueT <- renderPrint({input$TV})
    #output$inputValueR <- renderPrint({input$Radio})
    #output$inputValueM <- renderPrint({input$MSRP})
    output$outputValueB <- renderPrint({round(totAdvBudget(input$TV, input$Radio))})
    output$outputValueU <- renderPrint({round(predUnits(input$TV, input$Radio),0)})
    output$outputValueR <- renderPrint({round(predRev(input$TV, input$Radio,input$MSRP),0)})
    output$outputValueP <- renderPrint({round(predProf(input$TV, input$Radio,input$MSRP, input$Cost),0)})
}
)

