#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Répartition du nombre d'installations nucléaires en fonction de leur puissance maximale installée"),
        # Show a plot of the generated distribution
        mainPanel(
            img(src="Carte.png",height="100%", width="100%")),
            img(src="Histo_nucleaire.png",height="100%", width="100%")
            
        )

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
