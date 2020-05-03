library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    variables = reactiveValues(x=0, y=0)
    
    observeEvent(input$addPoints, {
        variables$x <- rnorm(input$points, 1, input$sdX) + 5*sample(c(1:input$gX),input$points,replace=TRUE)
        variables$y <- rnorm(input$points, 1, input$sdY) + 5*sample(c(1:input$gY),input$points,replace=TRUE)
        output$plot1 <- renderPlot({
            plot(variables$x,variables$y)  
        })              
    })
    
    observeEvent(input$addClusters, {
        df <- data.frame(x=variables$x,
                         y=variables$y)
        kmeansObj <- kmeans(df,centers=input$gX*input$gY)
        output$plot1 <- renderPlot({
            plot(x=variables$x,
                 y=variables$y,
                 col=kmeansObj$cluster)
            points(kmeansObj$centers,pch=3,cex=3,lwd=3)
        })              
    })
})
