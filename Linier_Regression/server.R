#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    data <- na.omit(airquality)
    data$date <- paste(data$Month, data$Day)
    data$date <- as.Date(data$date, format = "%m %d")

    model1 <- lm(Ozone ~ Solar.R, data = data)
    model2 <- lm(Ozone ~ Wind, data = data)
    model3 <- lm(Ozone ~ Temp, data = data)

    output$plot <- renderPlot({

        plot(data$date, data$Ozone, xlab = "Dates", ylab = "Ozone", bty ="n", pch = 16)
        if(input$Solar){
            model1lines <- predict(model1, newdata = data)
            lines(data$date, model1lines, col = "red", lwd = 2)
        }
        if(input$Wind){
            model2lines <- predict(model2, newdata = data)
            lines(data$date, model2lines, col = "blue", lwd = 2)
        }
        if(input$Temp){
            model3lines <- predict(model3, newdata = data)
            lines(data$date, model3lines, col = "green", lwd = 2)
        }
                

    })

})
