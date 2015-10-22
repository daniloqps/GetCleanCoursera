# Script run_analysis.R

#Step 1: Merges the training and the test sets to create one data set.
#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
#Step 3: Uses descriptive activity names to name the activities in the data set
#Step 4: Appropriately labels the data set with descriptive variable names. 
#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

options("scipen"=-100, "digits" = 7)
options("scipen"=100, "digits" = 7)
library(data.table)

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

ActLabels <- fread(file_activity_labels, col.names = c("ID", "DESC"), header = FALSE,  stringsAsFactors = FALSE)
Features  <- t(fread(file_features,  drop = 1, col.names = c("DESC"), header = FALSE,  stringsAsFactors = FALSE))

DTrain    <- fread(file_X_train, col.names = Features, header = FALSE, stringsAsFactors = FALSE, nrows=10 ) #ALERT - 10 only test
DTest     <- fread(file_X_test,  col.names = Features, header = FALSE, stringsAsFactors = FALSE, nrows=10 ) #ALERT - 10 only test

LTrain    <- fread(file_y_train, col.names = c("LABEL"), header = FALSE, stringsAsFactors = FALSE, nrows=10 ) #ALERT - 10 only test
LTest     <- fread(file_y_test,  col.names = c("LABEL"), header = FALSE, stringsAsFactors = FALSE, nrows=10 ) #ALERT - 10 only test

STrain    <- fread(file_subject_train, col.names = c("SUBJECT"), header = FALSE, stringsAsFactors = FALSE, nrows=10 ) #ALERT - 10 only test
STest     <- fread(file_subject_test , col.names = c("SUBJECT"), header = FALSE, stringsAsFactors = FALSE, nrows=10 ) #ALERT - 10 only test

FullTrain <- cbind(LTrain, STrain, DTrain)
FullTest  <- cbind(LTest,  STest,  DTest)

CompleteSet <- rbind(FullTrain, FullTest)




x<- c(1:31)

class(x)
DTrain <- DTrain[FALSE,]
class(DTrain)
DTest[[10,561]]

str(LTest)



#Rules

#Please upload the tidy data set created in step 5 of the instructions. Please upload your data set 
#as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly 
#into the text box, as this may cause errors saving your submission).

      #Has the student submitted a tidy data set? Either a wide or a long form of the data is acceptable if 
      #it meets the tidy data principles of week 1 (Each variable you measure should be in one column, 
      #Each different observation of that variable should be in a different row).
      
      
#Please submit a link to a Github repo with the code for performing your analysis. 
#The code should have a file run_analysis.R in the main directory that can be run as 
#long as the Samsung data is in your working directory. The output should be the tidy 
#data set you submitted for part 1. You should include a README.md in the repo describing 
#how the script works and the code book describing the variables.

      #Did the student submit a Github repo with the required scripts?
      
      #Was code book submitted to GitHub that modifies and updates the 
      #codebooks available to you with the data to indicate all the variables and 
      #summaries you calculated, along with units, and any other relevant information?

      #I was able to follow the README in the directory that explained what the analysis files did. 
