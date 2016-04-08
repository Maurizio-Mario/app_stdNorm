library(lattice)

shinyServer(
    function(input, output){
        output$sdNorm <- renderPlot({
            dt1 <- seq(-3, 3, length = 1000)
            dt2 <- dnorm(dt1, 0, 1)
            my_mean <- input$mean
            my_sd <- input$sd
            my_x <- input$x
            z <- (my_x - my_mean)/my_sd
            if(input$p1){
                
                xyplot(dt2 ~ dt1,
                       type = "l",
                       main = "Lower tail probability",
                       panel = function(x,y, ...){
                           panel.xyplot(x,y, ...)
                           panel.abline(v = c(z, 0), lty = 2)
                           xx <- c(-3, x[x>=-3 & x<=z], z) 
                           yy <- c(0, y[x>=-3 & x<=z], 0) 
                           panel.polygon(xx,yy, ..., col='red')
                       })
                
            }else{
                xyplot(dt2 ~ dt1,
                       type = "l",
                       main = "Standard Normal Distribution",
                       panel = function(x, ...){
                           panel.xyplot(x, ...)
                           panel.abline(v = c(z, 0), lty = 2)
                       })
            }
            
            })
        output$z = renderPrint({
            my_mean <- input$mean
            my_sd <- input$sd
            my_x <- input$x
            z <- (my_x - my_mean)/my_sd
            z
        })
        output$p1 <- renderPrint({
            if(input$p1){
                my_mean <- input$mean
                my_sd <- input$sd
                my_x <- input$x
                p1 <- 1- pnorm(my_x, my_mean, my_sd)
                p1
            } else {
                p1 <- NULL
            }

        })
        
    }
)