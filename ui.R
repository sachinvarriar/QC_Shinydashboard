
library(shiny)
library(shinydashboard)
library(qcc)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  dashboardPage(
    dashboardHeader(title = "QC Tool"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Single Sample Xbar-chart", tabName = "singlexbar", icon = icon("dashboard")),
        menuItem("Multi Sample Xbar-chart", tabName = "Multixbar", icon = icon("dashboard"))
      )
    ),
    dashboardBody(tabItems(
      tabItem(tabName = "singlexbar", fileInput('datafile1', 'Choose CSV file',
                            accept=c('text/csv', 'text/comma-separated-values,text/plain')),
                  uiOutput("Select Columns"),
                  #actionButton("plot", "Plot"),
            h2("Plot of Single Sample Xbar"),
            selectInput('x', 'X Variable',''),
            #tableOutput('content'),
    plotOutput("Plot1")),

    tabItem(tabName = "Multixbar", fileInput('datafile2', 'Choose CSV file',
                                                                   accept=c('text/csv', 'text/comma-separated-values,text/plain')),
                                 #uiOutput("Select Columns"),
                                 #actionButton("plot", "Plot"),
                                 h2("Plot of Multiple Xbar"),
                                 #selectInput('x', 'X Variable',''),
                                 #tableOutput('content'),
                                 plotOutput("Plot2")
   )
    ))

    )))

