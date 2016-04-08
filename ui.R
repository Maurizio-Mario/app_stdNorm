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
        h3('Standard Normal'),
        plotOutput('sdNorm'),
        h4('Your z-score is:'),
        verbatimTextOutput('z'),
        h4('Your lower tail probability is:'),
        verbatimTextOutput('p1')    
        ))
)