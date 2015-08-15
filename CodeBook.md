********************************************************************

### Introduction

This assignment serves as the practicing project of the Getting and Cleaning Data course. It aims to demonstrate one's ability to collect, work with, and clean a data set. Also, by this way can one deepen its understanding on R programming.


The main requirements are as follows:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

********************************************************************

### Explanations of variables, the data, etc.

I. Data set
training_X           data from "X_train.txt"
test_X               data from "X_test.txt"
training_subject     data from "subject_train.txt"
training_data        binding data sets training_X, test_X & training_subject, indicating datas of training group
test_subject, training_y, test_y, test_data        you knows :D
data                 the sum of all datas presented here, also as an initial form of data set(it's tiny data, of course!)
name                 names of features
sep_name1,sep_name2  names with character "mean()" or "std()"
sep_name             names with character "mean()" and "std()"
extracting_data_1    data set extracted in step II, which leaving only measurements on the mean and standard deviation
activity_name        names of activities
extracting_data_2    final forms of data set, and it's tiny data required

II.functions
final_extract        functions to form a data set with with the average of each variable for each activity and each subject

III.colnames of final data set
Volunteer_ID         subject, 1-30
Activities           names of 6 kinds of activities, including "SITTING", "STANDING", etc.
(others)             the same as what presented in "features_info.txt"

********************************************************************

### Grading

This assignment will be graded via peer assessment.
