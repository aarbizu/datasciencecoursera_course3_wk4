# Data Science, Coursera, Course 3 'Getting and Cleaning Data', Week 4

## Description
- Source data:  'Human Activity Recognition Using Smartphones Dataset' Version 1.0
- Source data URL: Available from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The R script with this repo, `run_analysis.R`, processes the data as follows:
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


## Codebook

The variables in the analyzed data set contain mean and standard deviation values for tri-axial measurements (X,Y,Z axes) of body and gravity acceleration components.  Further, each value in the analyzed set comprises the average of those mean and standard deviation measurements across samples for each subject and activity.  For example, `tBodyAcc_mean_[XYZ]_avg` and `tBodyAcc_std_[XYZ]_avg`.

Similarly, mean and standard deviation of time-derived acceleration signals, such as Jerk and angular velocity (Gyro) were summarized along each axis in, e.g. `tBodyAccJerk_mean_[XYZ]_avg` and `tBodyAccJerk_std_[XYZ]_avg`.

Euclidean norm computations were performed to determine the magnitude of the three-dimensional signals and their means and standard deviations appear in
variables containing 'Mag', e.g. `tBodyAccMag_mean_avg`

Values with the 'f' prefix represent the average of FFT (Fast Fourier Transforms) of the original time-domain measurements.

The complete list of variables:

tBodyAcc_mean_X_avg

tBodyAcc_mean_Y_avg

tBodyAcc_mean_Z_avg

tBodyAcc_std_X_avg

tBodyAcc_std_Y_avg

tBodyAcc_std_Z_avg

tGravityAcc_mean_X_avg

tGravityAcc_mean_Y_avg

tGravityAcc_mean_Z_avg

tGravityAcc_std_X_avg

tGravityAcc_std_Y_avg

tGravityAcc_std_Z_avg

tBodyAccJerk_mean_X_avg

tBodyAccJerk_mean_Y_avg

tBodyAccJerk_mean_Z_avg

tBodyAccJerk_std_X_avg

tBodyAccJerk_std_Y_avg

tBodyAccJerk_std_Z_avg

tBodyGyro_mean_X_avg

tBodyGyro_mean_Y_avg

tBodyGyro_mean_Z_avg

tBodyGyro_std_X_avg

tBodyGyro_std_Y_avg

tBodyGyro_std_Z_avg

tBodyGyroJerk_mean_X_avg

tBodyGyroJerk_mean_Y_avg

tBodyGyroJerk_mean_Z_avg

tBodyGyroJerk_std_X_avg

tBodyGyroJerk_std_Y_avg

tBodyGyroJerk_std_Z_avg

tBodyAccMag_mean_avg

tBodyAccMag_std_avg

tGravityAccMag_mean_avg

tGravityAccMag_std_avg

tBodyAccJerkMag_mean_avg

tBodyAccJerkMag_std_avg

tBodyGyroMag_mean_avg

tBodyGyroMag_std_avg

tBodyGyroJerkMag_mean_avg

tBodyGyroJerkMag_std_avg

fBodyAcc_mean_X_avg

fBodyAcc_mean_Y_avg

fBodyAcc_mean_Z_avg

fBodyAcc_std_X_avg

fBodyAcc_std_Y_avg

fBodyAcc_std_Z_avg

fBodyAccJerk_mean_X_avg

fBodyAccJerk_mean_Y_avg

fBodyAccJerk_mean_Z_avg

fBodyAccJerk_std_X_avg

fBodyAccJerk_std_Y_avg

fBodyAccJerk_std_Z_avg

fBodyGyro_mean_X_avg

fBodyGyro_mean_Y_avg

fBodyGyro_mean_Z_avg

fBodyGyro_std_X_avg

fBodyGyro_std_Y_avg

fBodyGyro_std_Z_avg

fBodyAccMag_mean_avg

fBodyAccMag_std_avg

fBodyBodyAccJerkMag_mean_avg

fBodyBodyAccJerkMag_std_avg

fBodyBodyGyroMag_mean_avg

fBodyBodyGyroMag_std_avg

fBodyBodyGyroJerkMag_mean_avg

fBodyBodyGyroJerkMag_std_avg

angletBodyAccMean_gravity_avg

angletBodyAccJerkMean_gravityMean_avg



