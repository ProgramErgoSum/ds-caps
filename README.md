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
