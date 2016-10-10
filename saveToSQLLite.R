#
source('scripts/grams-store.R')
#
saveToStore <- function(c) {
  biGramRds <- paste('grams/cut-',c,'/biGrams.rds',sep='', collapse='')
  triGramRds <- paste('grams/cut-',c,'/triGrams.rds',sep='', collapse='')
  quadGramRds <- paste('grams/cut-',c,'/quadGrams.rds',sep='', collapse='')
  pentaGramRds <- paste('grams/cut-',c,'/pentaGrams.rds',sep='', collapse='')
  #
  df <- data.frame(ng=as.character(),Freq=as.integer(), stringsAsFactors = FALSE)
  df <- summariseGrams(biGramRds)
  hs <- dfToHashSetDf(df)
  writeDfToSQLLite(hs)
  rm(df,hs)
  #
  df <- data.frame(ng=as.character(),Freq=as.integer(), stringsAsFactors = FALSE)
  df <- summariseGrams(triGramRds)
  hs <- dfToHashSetDf(df)
  writeDfToSQLLite(hs)
  rm(df,hs)
  #
  df <- data.frame(ng=as.character(),Freq=as.integer(), stringsAsFactors = FALSE)
  df <- summariseGrams(quadGramRds)
  hs <- dfToHashSetDf(df)
  writeDfToSQLLite(hs)
  rm(df,hs)
  #
  df <- data.frame(ng=as.character(),Freq=as.integer(), stringsAsFactors = FALSE)
  df <- summariseGrams(pentaGramRds)
  hs <- dfToHashSetDf(df)
  writeDfToSQLLite(hs)
  rm(df,hs) 
}

CUTNUM <- 1; saveToStore(CUTNUM)
CUTNUM <- 2; saveToStore(CUTNUM)
CUTNUM <- 3; saveToStore(CUTNUM)
CUTNUM <- 4; saveToStore(CUTNUM)
CUTNUM <- 5; saveToStore(CUTNUM)