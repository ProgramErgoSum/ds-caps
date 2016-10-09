source('scripts/tokenize-ngrams.R')
#
ngram <- 3
#
tFileName <- paste('final/en_US/twitter',ngram,'Grams.rds',sep="",collapse="")
bFileName <- paste('final/en_US/blogs',ngram,'Grams.rds',sep="",collapse="")
nFileName <- paste('final/en_US/news',ngram,'Grams.rds',sep="",collapse="")
#
ngc <- ngramsCounts(tweetCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
twitterGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(twitterGrams,file=tFileName)
rm(twitterGrams)
#
ngc <- ngramsCounts(blogsCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
blogsGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(blogsGrams,file=bFileName)
rm(blogsGrams)
#
ngc <- ngramsCounts(newsCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
newsGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(newsGrams,file=nFileName)
rm(newsGrams)
#
rm(ngc,ngbc)
##
ngram <- 4
#
tFileName <- paste('final/en_US/twitter',ngram,'Grams.rds',sep="",collapse="")
bFileName <- paste('final/en_US/blogs',ngram,'Grams.rds',sep="",collapse="")
nFileName <- paste('final/en_US/news',ngram,'Grams.rds',sep="",collapse="")
#
ngc <- ngramsCounts(tweetCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
twitterGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(twitterGrams,file=tFileName)
rm(twitterGrams)
#
ngc <- ngramsCounts(blogsCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
blogsGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(blogsGrams,file=bFileName)
rm(blogsGrams)
#
ngc <- ngramsCounts(newsCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
newsGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(newsGrams,file=nFileName)
rm(newsGrams)
#
rm(ngc,ngbc)
##
ngram <- 5
#
tFileName <- paste('final/en_US/twitter',ngram,'Grams.rds',sep="",collapse="")
bFileName <- paste('final/en_US/blogs',ngram,'Grams.rds',sep="",collapse="")
nFileName <- paste('final/en_US/news',ngram,'Grams.rds',sep="",collapse="")
#
ngc <- ngramsCounts(tweetCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
twitterGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(twitterGrams,file=tFileName)
rm(twitterGrams)
#
ngc <- ngramsCounts(blogsCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
blogsGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(blogsGrams,file=bFileName)
rm(blogsGrams)
#
ngc <- ngramsCounts(newsCorpusWords,ngram)
ngbc <- ngramsBinCounts(ngc)
newsGrams <- ngramsCountsFiltered(ngc,ngbc[1,1])
saveRDS(newsGrams,file=nFileName)
rm(newsGrams)
#
rm(ngc,ngbc)