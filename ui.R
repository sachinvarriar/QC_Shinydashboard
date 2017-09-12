
library(shiny)
library(shinydashboard)
library(qcc)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  dashboardPage(
    dashboardHeader(title = "QC Tool"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
      )
    ),
    dashboardBody(fileInput('datafile', 'Choose CSV file',
                            accept=c('text/csv', 'text/comma-separated-values,text/plain')),
                  uiOutput("Select Columns"),
                  #actionButton("plot", "Plot"),
            h2("Plot of UCL and LCL"),
            selectInput('x', 'X Variable',''),
            tableOutput('content'),
    plotOutput("Plot"))

    )))

