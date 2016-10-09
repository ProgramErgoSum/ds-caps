#
library(dplyr)
library(DBI)
library(RSQLite)
#
inputToGrams <- function(s) {
  l <- unlist(strsplit(s, ' '))
  
  t <- NULL
  for (i in seq(along = l)) {
    w <- l[i:length(l)]
    g <- paste(w, sep = ' ', collapse = ' ')
    t <- append(t, g)
  }
  
  return (t)
}
#
getProbableWordsSQL <- function(g) {
  con <- dbConnect(RSQLite::SQLite(), dbname = "SWIFT_KEY")
  qry <- paste(
    "SELECT * FROM SWIFT_KEY WHERE gram ='",
    g,
    "' order by count desc",
    sep = '',
    collapse = ''
  )
  rs <- dbSendQuery(con, qry)
  df <- dbFetch(rs)
  dbClearResult(rs)
  dbDisconnect(con)
  
  return(df)
}
#
predictWordsSQL <- function(inputString) {
  g <- inputToGrams(inputString)
  df <- data.frame(
    grams = as.character(),
    gramNumWords = as.integer(),
    word = as.character(),
    count = as.integer(),
    stringsAsFactors = FALSE
  )
  
  for (i in 1:length(g)) {
    wd <- getProbableWordsSQL(g[i])
    gm <- rep(g[i], nrow(wd))
    gw <- rep(length(unlist(strsplit(g[i], ' '))), nrow(wd))
    d0 <- data.frame(
      grams = as.character(gm),
      gramNumWords = as.integer(gw),
      word = as.character(wd$word),
      count = as.integer(wd$count),
      stringsAsFactors = FALSE
    )
    
    df <- merge(df, d0, all = TRUE)
    rm(d0)
  }
  
  df <- arrange(df, desc(gramNumWords, count))
  
  return(df)
}
#
predictWord <- function(inputString) {
  d0 <- predictWordsSQL(inputString)
  g1 <- group_by(d0, grams, gramNumWords)
  d1 <- summarise(g1, totalCount = sum(count))
  g2 <- group_by(d0, grams, gramNumWords, word)
  d2 <- as.data.frame(summarise(g2, wordCount = sum(count)))
  d3 <-
    merge(
      d1,
      d2,
      by.x = c('grams', 'gramNumWords'),
      by.y = c('grams', 'gramNumWords')
    )
  d4 <- mutate(d3, score = round(wordCount / totalCount, 5))
  g3 <- group_by(d4, grams)
  d5 <- filter(g3, score == max(score))
  d6 <- arrange(d5, desc(gramNumWords))
  
  rm(d0, g1, d1, g2, d2, d3, d4, g3, d5)
  
  return(d6[1, ])
}
#
predictWordDf <- function(inputString) {
  d0 <- predictWordsSQL(inputString)
  g1 <- group_by(d0, grams, gramNumWords)
  d1 <- summarise(g1, totalCount = sum(count))
  g2 <- group_by(d0, grams, gramNumWords, word)
  d2 <- as.data.frame(summarise(g2, wordCount = sum(count)))
  d3 <-
    merge(
      d1,
      d2,
      by.x = c('grams', 'gramNumWords'),
      by.y = c('grams', 'gramNumWords')
    )
  d4 <- mutate(d3, score = round(wordCount / totalCount, 5))
  g3 <- group_by(d4, grams)
  d5 <- filter(g3, score == max(score))
  d6 <- as.data.frame(arrange(d5, desc(gramNumWords)))
  
  rm(d0, g1, d1, g2, d2, d3, d4, g3, d5)
  
  return(d6)
}