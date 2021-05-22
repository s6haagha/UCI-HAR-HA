## Setting directory
setwd("../UCI HAR Dataset")

## loading the necessary packages
library(data.table)
library(dplyr)

## reading activity labels
activity_labels <- read.table("activity_labels.txt", col.names = c("code","activity"))

## reading features
features <- read.table("features.txt", col.names=c("n","features"))

## reading test datasets
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt")
names(x_test) = features$features
y_test <- read.table("./test/y_test.txt", col.names = "code")

## merging the test datasets
test <- cbind(subject_test, y_test, x_test)

## reading the train datasets
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt")
names(x_train) = features$features
y_train <- read.table("./train/y_train.txt", col.names = "code")

## Merging the train datasets
train <- cbind(subject_train, y_train, x_train)

## Merging test and train datasets
test_train <- rbind(train, test)

# Extract only the measurements mean and standard deviation for each subjec and code.
ext_columns <- c("subject", "code",grep("mean|std", names(test_train), value = TRUE))
extracted_data <- test_train[, ext_columns]

## Replacing activity codes with activity labels
for (i in 1:6) {
    extracted_data$code[extracted_data$code==i] <- activity_labels[i, "activity"]
}

## Renaming variables
column_names <- ext_columns
column_names[column_names=="subject"] <- "Subject"
column_names[column_names=="code"] <- "Activity"
column_names <- gsub("^t", "Time", column_names)
column_names <- gsub("\\.t", "Time", column_names)
column_names <- gsub("^f", "Frequency", column_names)
column_names <- gsub("Acc", "Accelerometer", column_names)
column_names <- gsub("Gyro", "Gyroscope", column_names)
column_names <- gsub("Mag", "Magnitude", column_names)
column_names <- gsub("BodyBody", "Body", column_names)
column_names <- gsub("\\.std\\.\\.", ".St.Dev", column_names)
column_names <- gsub("\\.mean\\.\\.", ".Mean", column_names)
column_names <- gsub("\\.\\.\\.", ".", column_names)

names(extracted_data) <- column_names

## Tidy dataset
tidy_data <- extracted_data

## Exporting
write.table(tidy_data, "../UCI-HAR/FinalData.txt", row.name=FALSE)


