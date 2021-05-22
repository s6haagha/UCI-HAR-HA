# Raw datasets

The raw data consists of three test and three training datasets.
Both test and training datasets consist of X, Y and subject datasets.
Activity labels data which shows the labels for each activity code.
Feature data shows the list of features.

# Reading in the datasets
Activity labels dataset is read in as activity_labels
Feature dataset is read in as features

Y_test, Y_train datasets are read in as y_test and y_train, respectively
Subject_test, Subject_train datasets are read in as subject_test and subject_train, respectively
X_test, X_train datasets are read in as X_test and X_train, respectively, using feautes$features as column names, as the column names are not available for this dataset.

# Merging datasets

First all test datasets (x_test, y_test, subject_test) are merged under test.
Then all train datasets (x_train, y_train, subject_train) are merged under train.

Then train and test datasets are merged under test_train

# Cleaning the dataset

First we extract columns from test_train that we need. These columns are the activity code, subject, mean and standard deviation columns.

Activity code column is replaced by activity labels using activity_label data.

Then variable names are corrected.

# Generating a dataset that include mean for all variables across subject and activity.

Generating a dataset that include mean for all variables across subject and activity.

# Saving data

The data is saved as "FinalData.txt"