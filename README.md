# Data Science, Coursera, Course 3 'Getting and Cleaning Data', Week 4

## Description
- Source data:  'Human Activity Recognition Using Smartphones Dataset' Version 1.0
- Source data URL: Available from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The R script with this repo, run_analysis.R processes the data as follows:
- R library depdendencies => { `dplyr` }
- Assumes the data from UCI is extracted to 'UCI HAR Dataset'
  - if different, edit the `har_data_directory` variable on line 12
- Raw data is consumed using `read.table()`
- Combines test subjects from the test and training sets
- Combines test activities from the test and training sets
- Read in the feature vector labels
- Combines test and training feature vector sets
- Removes and/or converts some special chars from feature vector labels
  - i.e. omit parentheses, convert commas and dashes to underscore
- Extract mean and standard deviation values
  - NB, the `*meanFreq*` values were omitted in this process
- Apply activity labels to the activity id values, after converting the column to a factor
- Summarize the extracted data by subject and activity type
- Output is written to `subject_and_activity_averages.txt`
