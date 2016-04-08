shinyUI(pageWithSidebar(
    headerPanel("Standard Normal"),
    sidebarPanel(
        numericInput('mean', 'Your mean', 0),
        numericInput('sd', 'Your standard deviation', 0),
        numericInput('x', 'Your score', 0)
    ),
    mainPanel(
        h3('Standard Normal'),
        plotOutput('sdNorm'),
        h4('Your z-score is:'),
        verbatimTextOutput('z')
    ))
)