library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Standard Normal Distribution"),
    sidebarPanel(
        wellPanel(
            numericInput('myMean', 'Your mean', 0),
            numericInput('mySd', 'Your standard deviation', 0),
            numericInput('myX', 'Your score', 0),
            conditionalPanel(
                condition = "input.p2=='p5'",
                numericInput('myY', 'Your second score:', 0)
            )
        ),
        
        wellPanel(
            checkboxInput("p", "Probability?", FALSE),
            conditionalPanel(
                condition = "input.p==true",
                selectInput(inputId = "p2", 
                            label = "Select the probability:",
                            choices = c("Less than x" = "p3",
                                        "More than x" = "p4", 
                                        "Between x and y" = "p5"),
                            selected = FALSE)
            )
            
        )
    ),
    
    mainPanel(
        h4('Standard Normal Curve'),
        plotOutput("sdNorm")
    )
)  
)