library(shiny)
library(lattice)
#library(rCharts)

shinyServer(function(input, output) {
    output$sdNorm <- renderPlot({
        dt1 <- seq(-4, 4, length = 1000)
        dt2 <- dnorm(dt1, 0, 1)
        myMean <- input$myMean
        mySd <- input$mySd
        myX <- input$myX
        myY <- input$myY
        z <- round((myX - myMean)/mySd, 4)
        z2 <- round((myY - myMean)/mySd, 4)
        
        xyplot(dt2 ~ dt1,
               type = "l",
               panel = function(x,y, ...){
                   panel.xyplot(x,y, ...)
                   p2 <- round(pnorm(myX, myMean, mySd), 4)
                   p3 <- round(pnorm(myY, myMean, mySd), 4)
                   panel.abline(v = c(z, 0), lty = 2)
                   panel.text(lab = c(paste("z = ", z, sep = "")), y = .41, x = z)
                   if(input$p==TRUE){
                       if(input$p2=="p3"){
                           xx <- c(-4, x[x>=-4 & x<=z], z) 
                           yy <- c(0, y[x>=-4 & x<=z], 0) 
                           panel.polygon(xx,yy, ..., col='blue')
                           panel.text(lab = paste("P(X<a) = ", p2, sep = ""), x = 3, y = 0.35)
                           
                       }else if(input$p2=="p4"){
                           
                           xx <- c(z, x[x>=z & x<=4], 4)
                           yy <- c(0, y[x>=z & x<=4], 0)
                           panel.polygon(xx,yy, ..., col='red')
                           panel.text(lab = paste("P(X>a) = ",(1 - p2), sep = ""), x = 3, y = 0.35)
                       }else{
                           
                           if(z < z2){
                               
                               xx <- c(z, x[x>=z & x<=z2], z2)
                               yy <- c(0, y[x>=z & x<=z2], 0)
                               panel.polygon(xx,yy, ..., col='red')
                               panel.text(lab = paste("P(a<X<b) = ",abs(p3 - p2), sep = ""), x = 3, y = 0.35)
                               panel.abline(v = c(z2, 0), lty = 2)
                               
                           }else{
                               xx <- c(z2, x[x>=z2 & x<=z], z)
                               yy <- c(0, y[x>=z2 & x<=z], 0)
                               panel.polygon(xx,yy, ..., col='red')
                               panel.text(lab = paste("P(a<X<b) = ", abs(p3 - p2), sep = ""), x = 3, y = 0.35)
                           }
                       }
                   }})
        
    })
})