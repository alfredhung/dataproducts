#
# This Shiny web application will calculate the Body Mass Index (BMI) of an adult given weight and height.  It'll return the National Institute of Health (US Dept. of Health & Human Services) classification based on the BMI. 
# 
# This app is intended to be used only in English units. 
# Height should be entered in both feet and inches, eg. 5'7". Measure your height while not wearing shoes.
#
# Weight should be entered in pounds and should be measured by substracting the weight of the clothes you have on or measured without clothes on.
#
# This ui.R file formats how the app should look, how the data should be entered, what values the data should take, and how the results should be presented
#
# To learn more about this app, BMI and IBW, please visit
# http://rpubs.com/alfredohung/155346

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  titlePanel("Determining your Body Mass Index"),

  # Sidebar with slider and numeric input for height and weight
  sidebarLayout(
    sidebarPanel(
        # Select individual's gender
        selectInput('gender','Gender', choices=list("Male"=1, "Female"=2)),
            
        helpText('Enter your height in feet and inches (eg.4ft 0in) in the corresponding boxes:'),
        
        # Height has two boxes to input feet and inches separately
        numericInput('feet', 'Height: feet', "4", min = 4, max = 7, step = 1),
        numericInput('inches', 'Height: inches', "0", min = 0, max = 11, step = 1),
        
        # Weight range is based on data of the general population
        sliderInput("weight", "Weight:", min = 50, max = 500, value = 50),
        
        # Submit when all data has been entered
        submitButton('Submit')
    ),
    
    mainPanel(
        # Show output of input data for height and weight 
        h4("The weight you entered is (lbs)"),
        verbatimTextOutput("weight"),
        h4("The height you entered is (inches)"),
        verbatimTextOutput("height"),
        
        # Show output of calculation of BMI and BMI classification
        h4("Your Body Mass Index is"),
        verbatimTextOutput("obmi"),
        h4("Your BMI (National Institute of Health) classification is"),
        verbatimTextOutput("obmi.result"),
        
        # Show ideal body weight
        h4("Your Ideal Body Weight in lbs is"),
        verbatimTextOutput("ideal.weight")
    )
  )
))
