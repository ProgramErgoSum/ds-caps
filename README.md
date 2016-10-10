# ds-caps

This is the source code repo for the Data Science Capstone project. 

## Source code description
In this section, the set of `R` files that was used for this project will be described.

### Build corpus
Start with `corpus.R` to convert the text files into corpus. This file sources the `tokenize-ngrams.R` file to do the following:

- Load a data set (twitter, blogs or news).
- Set a `FACTOR` value to process only a portion of the file. This is limited by the computer RAM.
- The resulting file has corpus saved into a `.rds` file.

### Generate tokens
Run `ngrams.R` to generate tokens. This file too sources the `tokenize-ngrams.R` file to do the following:
- Load the `.rds` file generate from the previous step.
- Set the variable `ngram` as 2 or 3 for bigrams, trigrams, etfc.
- Repeat this for n = 2, 3, 4 and 5.
- The result are files for n-grams per data set.

### Generate n-grams store
Run `allnGrams.R` to merge all the grams of a certain order.
- Load all bigrams (output from previous step) for tweets, blogs and news.
- Merge them into one large bigram dataset.
- Repeat the same for other n-grams.
- The result are files for one comprehensive data for a given n-gram.

### Store the n-grams
Run `saveToSQLLite.R` to save the grams data set into SQLLite data base. This file sources `grams-store.R` to do the following.
- Load the output from previous step into a data frame.
- Do some summary operations to obtain counts of words.
- Write to a SQLLite databsase `SWIFT_KEY`.

### Prediction
Run `predict.R` to obtain predicted word and score.
- Runs on top of `SWIFT_KEY` data base.
- Takes input as a 4 word phrase.
- Provides output as a predicted word.
- Provides output as a table of possible candidates.

### Shiny application
The Shiny application details are as follows:
- URL: https://programergosum.shinyapps.io/next-word/
- Uses `server.R`, `ui.R`, `predict.R` and `SWIFT_KEY` database.

