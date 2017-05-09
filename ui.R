#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR, quietly = TRUE)
data(diamonds)


# Define UI for application that predicts the price of a diamond based on weight
shinyUI(fluidPage(
  # Application title
  titlePanel("Predict price of diamond based on weight of diamond in carats"),
  # Sidebar with a slider input for carats
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderCarat","What is the weight of the diamond in carats?", 0.20, 5.01,value = 2.5)
    ),
    # Show a plot of Price verses Weight in carats"
    mainPanel(
        h4("This program fits a linear model to a data set of prices verses carat weights of diamonds"),
        h4("The user selects a carat weight, the using the model, a prediction of Singapore dollar cost is presented"),
        h5("Due to the size of the data set, the refresh may take a few seconds."),  
      plotOutput("plot"),
      h4("Predicted price in Singapore Dollars (SIN$) from Model Fit:"),
      textOutput("pred")
        )
    )
))

