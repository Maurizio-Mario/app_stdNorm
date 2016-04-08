shinyServer(
    function(input, output){
        output$sdNorm <- renderPlot({
            dt1 <- seq(-3, 3, length = 1000)
            dt2 <- dnorm(dt1, 0, 1)
            my_mean <- input$mean
            my_sd <- input$sd
            my_x <- input$x
            z <- (my_x - my_mean)/my_sd
            xyplot(dt2 ~ dt1,
                   type = "l",
                   main = "Standard Normal Distribution",
                   panel = function(x, ...){
                       panel.xyplot(x, ...)
                       panel.abline(v = z, lty = 2)
                   })
            })
        output$z = renderPrint({
            my_mean <- input$mean
            my_sd <- input$sd
            my_x <- input$x
            z <- (my_x - my_mean)/my_sd
            z
        })
        
    }
)