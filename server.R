#
# This server.R takes as input an individual's height in feet and inches, and weight in pounds. It converts the height data to all inch units, computes BMI and IBW, and determines NIH classification
# 

library(shiny)
# Formula to compute BMI
bmi <- function(weight, height) (weight*703/height^2)

# Define server logic to compute BMI and determine NIH classification
shinyServer(function(input, output) {
        # Convert height input to all inches
        height <- reactive({input$feet*12 + input$inches})
        
        # Print height and weight 
        output$height <- renderPrint({height()})
        output$weight <- renderPrint({input$weight})
        
        # Determine and print BMI
        bmio <- reactive(bmi(input$weight, height()))
        output$obmi <- renderPrint({round(bmio(), 2)})

        # Determine BMI Classification
        bmi.result <- reactive({
                if (bmio() < 18.5) {"Underweight"
                } else if (bmio() >= 18.5 & bmio() <= 24.9) {"Normal Weight"
                } else if (bmio() >= 25 & bmio() <= 29.9) {"Overweight"
                } else if (bmio() >= 30 & bmio() <= 39.9) {"Obesity"
                } else if (bmio() > 40) {"Extreme Obesity"}
        })
        # Print BMI classification
        output$obmi.result <- renderText({bmi.result()})
        
        # Determine ideal body weight by the Devine method
        ideal.body.weight <- reactive({
                if (input$gender ==1) (110.23+5.07*(height()-60))
                else if (input$gender==2) (100.31+5.07*(height()-60))
        })
        
        # Print ideal body weight
        output$ideal.weight <- renderPrint({ideal.body.weight()})
        }
  )
