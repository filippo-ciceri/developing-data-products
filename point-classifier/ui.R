library(shiny)

shinyUI(fluidPage(
    titlePanel("Cluster points with trees"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("points",
                        "Number of points:",
                        min = 100,
                        max = 2000,
                        value = 1000),
            sliderInput("sdX",
                        "Standard deviation X:",
                        min = 1,
                        max = 3,
                        value = 2,
                        step = 0.1),
            sliderInput("sdY",
                        "Standard deviation Y:",
                        min = 1,
                        max = 3,
                        value = 2,
                        step = 0.1),
            sliderInput("gX",
                        "Groups on X axis:",
                        min = 2,
                        max = 5,
                        value = 2),
            sliderInput("gY",
                        "Groups on Y axis:",
                        min = 2,
                        max = 5,
                        value = 2),
            actionButton("addPoints", "Generate points"),
            actionButton("addClusters", "Add clusters"),
            tags$a(
                href="https://filippo-ciceri.github.io/developing-data-products/point-classifier/point-classifier.html
",
                'Need more information? Click here'
            )
        ),
        mainPanel(
            plotOutput("plot1")
        )
    )
))
