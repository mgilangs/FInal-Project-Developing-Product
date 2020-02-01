#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# load required libraries
library(shiny)
library(maps)
library(mapdata)
library(ggplot2)

# load country mapping data
states <- map_data("world2")

# make the first country choice be NA
state_choices <- c("")

# append the country choices
state_choices <- c(state_choices, unique(states$region))

# Define UI for application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Maps in The World"),
    
    # Sidebar with drop down selector to choose the Department
    # Also includes instructions to use the application
    sidebarLayout(position = "right",
        sidebarPanel(
            "Select a Country to highlight:",
            selectInput("sel_country", "",state_choices, selected = NULL, multiple=FALSE),
            h4("Detailed Instructions"),
            "This application allows you to choose a Country to highlight on a map of the various in the World. 
      Use the selector above to choose a Country to display.",
            
        ),
        
        # Show the map plot
        mainPanel(
            h4("The Country"),
            plotOutput("mapPlot")
        )
    )
))