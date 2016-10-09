## Coursera Capstone Project
#
# the goal of this code is to create the right layout for my shiny app
library(shiny)
#
source('predict.R')
#
shinyUI(pageWithSidebar(
  headerPanel("Predict next word"),
  
  sidebarPanel(
    textInput("text", label = h3("Input"),
              value = "enter 4 word phrase"),
    
    h6(em("Note: See assumptions.")),
    
    submitButton("Submit")
    
  ),
  
  mainPanel(
    h4("Predicted word:"),
    verbatimTextOutput("next_word"),
    
    h4("Predicted word score:"),
    verbatimTextOutput("word_score"),
    
    h4("Top 10 predicted words:"),
    tableOutput('wordScores'),
    
    br(),
    h5('ABOUT'),
    h6(
      "Show the next possible word based on the input string. The corpus used to build the prediction algorithm can be found at:"
    ),
    h6(a("http://www.corpora.heliohost.org/")),
    h6('The source code is available at:'),
    h6(a("https://github.com/ProgramErgoSum")),
    
    br(),
    h5('ASSUMPTIONS'),
    h6('Entered text should not have numbers or punctuation.'),
    h6('Entered text should have 3-4 words.'),

    br(),
    h5('HOW IT WORKS'),
    h6('Corpus was broken down to 5-gram, 4-gram, 3-gram language models.'),
    h6('Language model was converted to a simple data store for look-up.'),
    h6(
      'Entered text is looked up using Stupi Backoff algorithm to check against all n-grams.'
    ),
    h6('Output is a word with the highest score calculated.'),
    h6('Also, a table of top 10 candidate words are also displayed with their scores.'),
    h6('Try the phrase, "i love you" without quotes'),
    
    br(),
    h5('NOTES'),
    h6(
      'Improvements are possible for language models based on sophistication of corpus development.'
    ),
    h6(
      'Based on target of deployment, the data store for the language model look-up could be a SQLite database on a phone or a Redis cluster on the cloud.'
    ),
    h6(
      'Current development uses SQLite database for data store and has a initial loading time.'
    ),
    h6(
      'More sophisticated data stores such as PostgreSQL on AWS or a Redis cluster on AWS can also be explored.'
    )
  )
  
))