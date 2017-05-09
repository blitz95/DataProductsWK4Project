#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(UsingR, quietly = TRUE)
data(diamonds)
library(shiny)


# Define server logic required to predict cost of diamond from based on weight input"
shinyServer(function(input, output) {
    model <- lm(price ~ carat, data = diamonds)
    
    modelpred <- reactive({
        caratInput <- input$sliderCarat
        predict(model, newdata = data.frame(carat = caratInput))
    })    
    
    output$plot <- renderPlot({
        CaratInput <- input$sliderCarat
        
        plot(diamonds$carat, diamonds$price, xlab = "Weight (Carats)", 
             ylab = "Price (SIN $)", bty = "n", pch = 16, col=rgb(0,0,0,alpha=0.1),
             xlim = c(0,5), ylim = c(300,35000))

        abline(model, col = "red", lwd = 2)
            
        legend(25, 250, c("Model Prediction"), pch = 16,
               col = c("red"), bty = "n", cex = 1.2)
        points(CaratInput, modelpred(), col = "red", pch = 10, cex = 2.5)
    })

    output$pred <- renderText({
        paste("SIN $", format(round(modelpred(), 2), big.mark = ","))
    })
})