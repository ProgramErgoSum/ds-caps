library(shiny)
#
source('predict.R')
#
shinyServer(function(input, output) {
  testInput <- reactive({
    validate(
      need(input$text != "", "Text field cannot be empty"),
      need(length(unlist(
        strsplit(input$text, ' ')
      )) < 4, "Enter 3-4 words")
    )
  })
  
  nextWord <- reactive({
    testInput()
    t <- tolower(input$text)
    predictWord(t)
  })
  
  output$next_word <- renderText({
    nw <- nextWord()
    nw$word
  })
  output$word_score <- renderText({
    nw <- nextWord()
    nw$count
  })
  output$wordScores <- renderTable({
    testInput()
    t <- tolower(input$text)
    predictWordDf(t)
  })
})