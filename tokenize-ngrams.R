library(NLP)
library(tau)
library(tm)
library(dplyr)
library(parallel)
#
newLineToSpace <-
  content_transformer(function(x) {
    return (gsub("\\n", " ", x))
  })
tabToSpace <-
  content_transformer(function(x) {
    return (gsub("\\t", " ", x))
  })
ctrlToSpace <-
  content_transformer(function(x) {
    return (gsub("[[:cntrl:]]", " ", x))
  })
#
trainData <- function(fileName) {
  t <-
    readLines(fileName,
              encoding = 'UTF-8',
              skipNul = TRUE)
  trainSize <- round(FACTOR * length(t))
  trainRange <- c(1+trainSize*(BATCH-1),trainSize*BATCH)
  trainTweet <- t[trainRange[1]:trainRange[2]]
  rm(t)
  
  return (trainTweet)
}
#
buildCorpus <- function(trainData) {
  trainCorpus <- Corpus(VectorSource(trainData))
  trainCorpus <- tm_map(trainCorpus, content_transformer(tolower))
  trainCorpus <- tm_map(trainCorpus, removePunctuation)
  trainCorpus <- tm_map(trainCorpus, removeNumbers)
  trainCorpus <- tm_map(trainCorpus, newLineToSpace)
  trainCorpus <- tm_map(trainCorpus, tabToSpace)
  trainCorpus <- tm_map(trainCorpus, ctrlToSpace)
  trainCorpus <- tm_map(trainCorpus, stripWhitespace)
  
  return (trainCorpus)
}
#
corpusToWords <- function(tc) {
  tcl <- sapply(tc,function(x) {return (unlist(x$content,use.names = F))})
  trainCorpusStr <- NULL
  trainCorpusStr <- paste(trainCorpusStr, tcl, collapse="")
  trainCorpusWords <- strsplit(trainCorpusStr, " ", fixed = TRUE)[[1]]
  rm(trainCorpusStr)
  
  return (trainCorpusWords)
}
#
ngramsCounts <- function(corpusWords, n) {
  ng <- vapply(ngrams(corpusWords,n), paste, "", collapse=" ")
  #ng <- ngrams(corpusWords,n)
  ngc <- as.data.frame(xtabs(~ng))
  rm(ng)
  
  return (ngc)
}
#
ngramsBinCounts <- function(ngc) {
  h <- hist(ngc$Freq, plot = FALSE)
  b <- h$breaks
  c <- h$counts
  binCounts <- data.frame(bins = b[2:length(b)], count = c)
  
  return (binCounts)
}
#
ngramsCountsFiltered <- function(ngc, k) {
  ngramsFilter <- filter(ngc, Freq > k)

  return (ngramsFilter)
}
#
ngramsCountsSorted <- function(ngc, k) {
  ngramsFilter <- filter(ngc, Freq > k)
  ngramsFreqSorted <- order(ngramsFilter$Freq, decreasing = TRUE)
  ngramsSorted <- as.data.frame(ngramsFilter[ngramsFreqSorted, ])
  
  return (ngramsSorted)
}
## 