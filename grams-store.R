FRACTION <- 1.0
#
mergeGrams <- function(newDf, rds) {
  df <- readRDS(rds)
  N <- nrow(df)
  n <- round(N*FRACTION)
  s <- sample(N,n)
  dfs <- df[s,]
  
  nDf <- merge(newDf,dfs,all=TRUE)
  rm(df,dfs)
  return(nDf)
}