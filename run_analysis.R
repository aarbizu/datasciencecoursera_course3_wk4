# run_analysis.R
# 
# Run a data analysis on Human Activity Recognition files

# load packages
library(dplyr)

# check that the 'UCI Har Dataset' directory exists in the
# current working directory. If not, exit with a helpful message
# reminding the user where to run the script from.

har_data_directory <- c("UCI HAR Dataset")
if (!dir.exists(har_data_directory)) {
  print(paste0("Please run this script from a directory containing: '",har_data_directory,"'"), quote=F)
} 

# Merge test and training data sets

test_subject_file <- paste0(har_data_directory,"/test/subject_test.txt")
print(paste0("reading: ",test_subject_file), quote=F)
test_subjects <- read.table(test_subject_file)

train_subject_file <- paste0(har_data_directory,"/train/subject_train.txt")
print(paste0("reading: ",train_subject_file), quote=F)
train_subjects <- read.table(train_subject_file)

print(paste0("combining test and train subjects"), quote=F)
subject <- c(test_subjects, train_subjects, recursive=T)

test_activity_file <- paste0(har_data_directory,"/test/y_test.txt")
print(paste0("reading: ",test_activity_file), quote=F)
test_labels <- read.table(test_activity_file)

train_activity_file <- paste0(har_data_directory,"/train/y_train.txt")
print(paste0("reading: ", train_activity_file), quote=F)
train_labels <- read.table(train_activity_file)

print(paste0("combining test and train labels"), quote=F)
activity <- c(test_labels, train_labels, recursive=T)

data_set <- data.frame(subject, activity)

feature_label_file <- paste0(har_data_directory,"/features.txt")
print(paste0("collecting feature variable names"), quote=F)
feature_labels <- read.table(feature_label_file, col.names=c("n", "feature"))

test_feature_vector_file <- paste0(har_data_directory,"/test/X_test.txt")
print(paste0("reading: ", test_feature_vector_file), quote=F)
test_features <- read.table(test_feature_vector_file, col.names=as.vector(feature_labels$feature))

train_feature_vector_file <- paste0(har_data_directory,"/train/X_train.txt")
print(paste0("reading: ", train_feature_vector_file), quote=F)
train_features <- read.table(train_feature_vector_file, col.names=as.vector(feature_labels$feature))

print(paste0("combining test/train feature vectors"), quote=F)
features <- rbind(test_features, train_features)

print(paste0("processing feature labels"), quote=F)

# remove parens from feature labels
feature_labels$feature <- gsub('[\\(\\)]','', feature_labels$feature)

# dashes and commas to underscores
feature_labels$feature <- gsub('[-,]', '_', feature_labels$feature)

# apply feature name changes
names(features) <- feature_labels$feature

data_set <- cbind(data_set, features)

# extract mean and standard deviation measurements (avoiding 'meanFreq' measurements)
data_set <- data_set[,grepl("subject|activity|mean(?!Freq)|std",names(data_set),ignore.case=T,perl=T)]


# convert activity column to a factor and apply activity labels
print(paste0("renaming activity types"),quote=F)
activity_labels_file <- paste0(har_data_directory,"/activity_labels.txt")
activity_labels <- read.table(activity_labels_file, col.names=c("n","activity"))
data_set$activity <- as.factor(data_set$activity)
levels(data_set$activity) <- activity_labels$activity

# convert data.frame to tibble and summarize by subject, activity
print(paste0("summarizing over subject, activity"), quote=F)
data_set_tbl <- tbl_df(data_set)
average_by_subject_and_activity <- data_set_tbl %>%
  group_by(subject, activity) %>%
  summarize_all(funs(avg=mean))

# write summarized tibble to a file
output_file <- "subject_and_activity_averages.txt"
print(paste0("writing summary by subject & activity"), quote=F)
write.table(average_by_subject_and_activity, file=output_file,row.names=F)

print(average_by_subject_and_activity)



