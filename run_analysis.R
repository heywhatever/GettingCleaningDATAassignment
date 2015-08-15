## Detailed explanations of the following R codes 
## are presented in README.txt

## STEP I

training_X <- read.table("UCI HAR Dataset/train/X_train.txt", header=F, sep="", fill=T)
test_X <- read.table("UCI HAR Dataset/test/X_test.txt", header=F, sep="", fill=T)
training_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F, sep="", fill=T)

test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F, sep="", fill=T)
training_y <- read.table("UCI HAR Dataset/train/y_train.txt", header=F, sep="", fill=T)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", header=F, sep="", fill=T)

training_data <- cbind(training_subject,training_y,training_X) 
test_data <- cbind(test_subject,test_y,test_X)
data <- rbind(training_data,test_data)

## STEP II

name <- read.table("UCI HAR Dataset/features.txt", header=F, sep="", fill=T)

sep_name1 <- name[grep("mean()",name[,2],fixed = T),]
sep_name2 <- name[grep("std()",name[,2],fixed = T),]

sep_name <- rbind(sep_name1,sep_name2)
extracting_data_1 <- data[,c(1,2,sep_name$V1+2)]


## STEP III

activity_name <- read.table("UCI HAR Dataset/activity_labels.txt",sep = "",fill = T,header = F)

extracting_data_1[,2] <- activity_name[extracting_data_1[,2],2]

## STEP IV

colnames(extracting_data_1) <- c("Volunteer_ID","Activities",as.vector(sep_name[,2]))

## STEP V

final_extract <- function(database,activity){
  
  G <- data.frame()
  
  
  for(i in 1:30){
    
    for(j in (6*i-5):(6*i-1)){
      
      G[j,1] <- i
      G[j,2] <- activity[j%%6, 2]
      
      for(m in 3:68){
        
        G[j,m] <- mean(database[database[,1] == i & database[,2] == G[j,2],m])
        
      }
      
    }
    
    for(j in 6*i){
      
      G[j,1] <- i
      G[j,2] <- activity[6, 2]
      
      for(m in 3:68){
        
        G[j,m] <- mean(database[database[,1] == i & database[,2] == G[j,2],m])
        
      }
      
    }
    
    
  }
  
  colnames(G) <- colnames(database)
  return(G)
  
  
}

extracting_data_2 <- final_extract(extracting_data_1,activity_name)