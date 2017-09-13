

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {


  filedata <- reactive({
    req(input$datafile1)
    infile <- input$datafile1
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
   df<-read.csv(infile$datapath)
    updateSelectInput(session, inputId = 'x', label = 'X Variable',
                     choices = names(df), selected = names(df))
    #updateSelectInput(session, inputId = 'ycol', label = 'Y Variable',
                     # choices = names(df), selected = names(df)[2])

    return(df)
  })

  filedata2 <- reactive({
    req(input$datafile2)
    infile <- input$datafile2
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    df<-read.csv(infile$datapath)
    updateSelectInput(session, inputId = 'x', label = 'X Variable',
                      choices = names(df), selected = names(df))
    #updateSelectInput(session, inputId = 'ycol', label = 'Y Variable',
    # choices = names(df), selected = names(df)[2])

    return(df)
  })

  output$content <- renderTable({
    filedata()[,c(input$x)]
  })

  output$Plot1 <- renderPlot({
    # for a histogram: remove the second variable (it has to be numeric as well):
    # x    <- data()[, c(input$xcol, input$ycol)]
    # bins <- nrow(data())
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')

    # Correct way:
    # x    <- data()[, input$xcol]
    # bins <- nrow(data())
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')


    # I Since you have two inputs I decided to make a scatterplot
    x2 <- filedata()[, c(input$x)]
    qcc(x2, type = "xbar.one", title="Single Sample X-bar Chart")
    #boxplot(x2)

  })

  output$Plot2 <- renderPlot({
    # for a histogram: remove the second variable (it has to be numeric as well):
    # x    <- data()[, c(input$xcol, input$ycol)]
    # bins <- nrow(data())
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')

    # Correct way:
    # x    <- data()[, input$xcol]
    # bins <- nrow(data())
    # hist(x, breaks = bins, col = 'darkgray', border = 'white')


    # I Since you have two inputs I decided to make a scatterplot
    x2 <- filedata2()[,1:ncol(filedata2())]
    qcc(x2, type = "xbar",title= "Multiple Sample X-bar Chart")
    #boxplot(x2)

  })

  filedata3 <- reactive({
    req(input$datafile3)
    infile <- input$datafile3
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    df<-read.csv(infile$datapath)
    updateSelectInput(session, inputId = 'x', label = 'X Variable',
                      choices = names(df), selected = names(df))
    #updateSelectInput(session, inputId = 'ycol', label = 'Y Variable',
    # choices = names(df), selected = names(df)[2])

    return(df)
  })

  output$Plot3 <- renderPlot({
    # I Since you have two inputs I decided to make a scatterplot
    x2 <- filedata3()[,1:ncol(filedata3())]
    qcc(x2, type = "R",title= "Multiple Sample R Chart")
    #boxplot(x2)

  })
})
