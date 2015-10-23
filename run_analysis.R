# Script run_analysis.R

#Step 1: Merges the training and the test sets to create one data set.
#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#Step 3: Uses descriptive activity names to name the activities in the data set
#Step 4: Appropriately labels the data set with descriptive variable names. 
#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)
library(tidyr)
library(dplyr)

# FILES CONSTANTS
dir                     <- "UCI HAR Dataset"
dir_test                <- "test"
dir_train               <- "train"
file_activity_labels    <- paste(dir,            "activity_labels.txt", sep = "\\")
file_features           <- paste(dir,            "features.txt",        sep = "\\")
file_X_train            <- paste(dir, dir_train, "X_train.txt",         sep = "\\")
file_y_train            <- paste(dir, dir_train, "y_train.txt",         sep = "\\")
file_subject_train      <- paste(dir, dir_train, "subject_train.txt",   sep = "\\")
file_X_test             <- paste(dir, dir_test,  "X_test.txt",          sep = "\\")
file_y_test             <- paste(dir, dir_test,  "y_test.txt",          sep = "\\")
file_subject_test       <- paste(dir, dir_test,  "subject_test.txt",    sep = "\\")

ActLabels <- fread(file_activity_labels, col.names = c("id", "desc"), header = FALSE,  
                   stringsAsFactors = FALSE)
Features  <- t(fread(file_features,  drop = 1, col.names = c("desc"), header = FALSE, 
                     stringsAsFactors = FALSE))

DTrain    <- fread(file_X_train, col.names = Features, header = FALSE, 
                   stringsAsFactors = FALSE, nrows=-1 ) #ALERT - 10 only test
DTest     <- fread(file_X_test,  col.names = Features, header = FALSE, 
                   stringsAsFactors = FALSE, nrows=-1 ) #ALERT - 10 only test

LTrain    <- fread(file_y_train, col.names = c("activity"), header = FALSE, 
                   stringsAsFactors = FALSE, nrows=-1 ) #ALERT - 10 only test
LTest     <- fread(file_y_test,  col.names = c("activity"), header = FALSE, 
                   stringsAsFactors = FALSE, nrows=-1 ) #ALERT - 10 only test

STrain    <- fread(file_subject_train, col.names = c("subject"), header = FALSE, 
                   stringsAsFactors = FALSE, nrows=-1 ) #ALERT - 10 only test
STest     <- fread(file_subject_test , col.names = c("subject"), header = FALSE, 
                   stringsAsFactors = FALSE, nrows=-1 ) #ALERT - 10 only test

# FREE FEATURES
rm(Features)

# BIND AND FREE TRAIN SET
FullTrain <- cbind(LTrain, STrain, DTrain)
rm(LTrain, STrain, DTrain)

#BIND AND FREE TEST SET
FullTest  <- cbind(LTest,  STest,  DTest)
rm(LTest, STest, DTest)

#BIND AND FREE FULLTRAIN AND FULLTEST
CompleteSet <- rbind(FullTrain, FullTest)
rm(FullTrain, FullTest)

#TRANSFORM AND FREE
TidyData <- CompleteSet %>% 
                select(contains("activity"), contains("subject"), 
                         contains("mean()"),contains("std()")) %>%
                  mutate(activity = as.character(ActLabels$desc[activity]))
rm(CompleteSet, ActLabels)

#SUMMARIZE AND FREE
Output <- TidyData %>% group_by(activity, subject) %>% summarize_each(funs(mean))
rm(TidyData)

#SET OPTIONS TO SCIENTIFIC NOTATION
options("scipen"=-100)
write.table(Output, file = "output.txt", row.names = FALSE)
options("scipen"=0)

#FREE ALL
rm(Output)
rm(dir, dir_test, dir_train, file_activity_labels, file_features,  
   file_X_train , file_y_train, file_subject_train, file_X_test, 
   file_y_test, file_subject_test )
