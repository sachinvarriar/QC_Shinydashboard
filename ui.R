
library(shiny)
library(shinydashboard)
library(qcc)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  dashboardPage(skin="yellow",
    dashboardHeader(title = "QC Tool"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Single Sample Xbar-chart", tabName = "singlexbar", icon = icon("line-chart")),
        menuItem("Multi Sample Xbar-chart", tabName = "Multixbar", icon = icon("line-chart")),
        menuItem("Multi Sample R-chart", tabName = "MultiR", icon = icon("line-chart")),
        menuItem("EWMA-chart", tabName = "EWMA", icon = icon("line-chart"))
        #,
        #menuItem("One-Way Anova", tabName = "Anova", icon = icon("calculator"))
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
                                 h2("Plot of Multiple Sample Xbar"),
                                 #selectInput('x', 'X Variable',''),
                                 #tableOutput('content'),
                                 plotOutput("Plot2")
   ),
   tabItem(tabName = "MultiR", fileInput('datafile3', 'Choose CSV file',
                                            accept=c('text/csv', 'text/comma-separated-values,text/plain')),
          #uiOutput("Select Columns"),
           #actionButton("plot", "Plot"),
           h2("Plot of Multiple Sample R"),
           #selectInput('x', 'X Variable',''),
           #tableOutput('content'),
           plotOutput("Plot3")
   ),
   tabItem(tabName = "EWMA", fileInput('datafile4', 'Choose CSV file',
                                         accept=c('text/csv', 'text/comma-separated-values,text/plain')),
           #uiOutput("Select Columns"),
           #actionButton("plot", "Plot"),
           h2("Plot of EWMA"),
           #selectInput('x', 'X Variable',''),
           #tableOutput('content'),
           plotOutput("Plot4")
    )
  # ,
   # tabItem(tabName = "Anova", fileInput('datafile5', 'Choose CSV file',
   #                                      accept=c('text/csv', 'text/comma-separated-values,text/plain')),
   #         uiOutput("Select Columns"),
   #         #actionButton("plot", "Plot"),
   #         h2("Anova Results"),
   #         selectInput('x', 'Dependent Variable',''),
   #         selectInput('y', 'Independent Variable',''),
   #         verbatimTextOutput("ei"),
   #         #tableOutput('content'),
   #         plotOutput("Plot5"))
   # 
   
    ))

    )))

