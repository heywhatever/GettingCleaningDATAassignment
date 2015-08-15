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

### Main thoughts when solving problems

====================================================================

### Step I

Firstly, we should have an appropriate understanding about the frame of data base needed in the project. Here, the former 2 columns are set as subjects and activities, and the other listed are collected data, all sharing with the same representating meanings of what "features.txt" gives us.  

The method we choose is, maybe, the least sophisticated one, which is by the function cbind() or rbind(). We read the essential tables to get all data, then merging them all in correct order is not that hard.

====================================================================

### Step II

As for extraction, we need to extract all feature names with the character "mean()" or "std()" initially, with the help of function "grep()". Using what Jeff taught us in week 3 course, we can extract the measurements on the mean and standard deviation for each measurement.

====================================================================

### Step III

It means to change the descriptive activity form from numeric to character. Read the "activity_labels.txt", then make changes. It works.

====================================================================

### Step IV

Change the columnnames of extrcted dataframe. Use function "colnames()".

====================================================================

### Step V

No doubt the hardest one. Here, I try to use the "for" loop to carry out multiple calculations and at the same time, data set is gradually given corresponding values.

Considering of the briefness and understandablity, the final form is presented as a function "final_extract". We use "for" loop for three times, one in others. Next, I would explain them words by words.

final_extract <- function(database,activity){
G <- data.frame()         
## giving initial values of data set G

for(i in 1:30){           
## subject 1-30
         
for(j in (6*i-5):(6*i-1)){          
## the rows describing the subject i, except the (6*i)th 
              G[j,1] <- i                    
## Subject numbers
              G[j,2] <- activity[j%%6, 2]    
## Activity names               
              for(m in 3:68){                
## column 3-68
                     G[j,m] <- mean(database[database[,1] == i & database[,2] == G[j,2],m])     
                          
## calculating the average value of data with the same subject and activity names, and then delieving the values to the corresponding positions in data set G 
              }                 
         }
         for(j in 6*i){                      
## nearly the same, aiming at the (6*i)th rows
              G[j,1] <- i
              G[j,2] <- activity[6, 2]                   
              for(m in 3:68){
                     G[j,m] <- mean(database[database[,1] == i & database[,2] == G[j,2],m])
              }                  
         }
}
colnames(G) <- colnames(database)            
## column names stay the unchanged 

return(G)
}

extracting_data_2 <- final_extract(extracting_data_1,activity_name)   ## make the use of the function for step V

********************************************************************

### Grading

This assignment will be graded via peer assessment.
