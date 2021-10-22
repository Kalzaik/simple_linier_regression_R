#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Ozone Linier Regression Model"),

    sidebarLayout(
        sidebarPanel(
            h3("Please check the predictor of the linier regression model"),
            checkboxInput("Solar", "Show/Hide Solar effect", value = TRUE),
            checkboxInput("Wind", "Show/Hide Wind effect", value = TRUE),
            checkboxInput("Temp", "Show/Hide Temp effect", value = TRUE),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("This is the Solar Radiation Model"),
            plotOutput("plot"),

        )
    )
))
