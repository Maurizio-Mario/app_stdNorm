library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Standard Normal"),
    sidebarPanel(
        numericInput('mean', 'Your mean', 0),
        numericInput('sd', 'Your standard deviation', 0),
        numericInput('x', 'Your score', 0),
        checkboxInput('p1', label = 'Probability of getting a score smaller than x or z', value = FALSE)
    ),
    mainPanel(
        h6('Feed the app with the mean and the standard deviation of a distribution. Then, add the x value that you want to identify on the standard Normal distribution. Furthermore, By checkin the box Probability, you can get the probability to find a score minor than x.'),
        plotOutput('sdNorm'),
        h4('Your z-score is:'),
        verbatimTextOutput('z'),
        h4('Probability:'),
        verbatimTextOutput('p1')    
        ))
)