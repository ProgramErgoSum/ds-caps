source('scripts/tokenize-ngrams.R')
#
tFileName <- 'final/en_US/en_US.twitter.txt'
bFileName <- 'final/en_US/en_US.blogs.txt'
nFileName <- 'final/en_US/en_US.news.txt'
#
BATCH <- 4
#
FACTOR <- 0.25
tweetTrain <- trainData(tFileName)
tweetCorpus <- buildCorpus(tweetTrain)
tweetCorpusWords <- corpusToWords(tweetCorpus)
rm(tweetTrain,tweetCorpus)
#
FACTOR <- 0.20
blogsTrain <- trainData(bFileName)
blogsCorpus <- buildCorpus(blogsTrain)
blogsCorpusWords <- corpusToWords(blogsCorpus)
rm(blogsTrain,blogsCorpus)
#
FACTOR <- 0.25
newsTrain <- trainData(nFileName)
newsCorpus <- buildCorpus(newsTrain)
newsCorpusWords <- corpusToWords(newsCorpus)
rm(newsTrain,newsCorpus)
#