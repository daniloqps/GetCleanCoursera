# GetCleanCoursera
Task to Coursera Specialization - Getting and Cleaning Data

References: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Raw Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This file contains a detailed instruction about the technical process to Get and Clean the "Human Activity Recognition Using Smartphones" Dataset (see references) using R Programming Language.

R contains many packages to facilitate the process to Get and Clean any type of Datasets, but is necessary to find the best to supply.

The first step is understand the rules to Get and Clean dataset to scientific analysis, explained below.

In the begin, the data is called RAW Data.

            Raw data
            
            The original source of the data
            Often hard to use for data analyses
            Data analysis includes processing
            Raw data may only need to be processed once
            [http://en.wikipedia.org/wiki/Raw_data]

At the end, we got Processed Data or Tidy Data
            
            Processed data
            
            Data that is ready for analysis
            Processing can include merging, subsetting, transforming, etc.
            There may be standards for processing
            All steps should be recorded
            [http://en.wikipedia.org/wiki/Computer_data_processing]

Now, we'll link this information with R Functions.

Step 1: Loading

R Language has many functions to load data, but in this case, the Dataset contains ~ 100mb, so we needed a very efficient function:
            
            {data.table} fread : "Similar to read.table but faster and more convenient." R Documentation

In this dataset, some informations was allocated in different files

- Data Files: subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt, y_test.txt
- Description Files: activity_labels.txt, features_info.txt  

The files X_train.txt and X_test.txt contains a lot of columns and we can bind the name of them direct in fread(). So, we need to load features_info.txt before, using the same fread() function, but converting rows in columns to adjust with the parameter col.names in fread(). To do this we use t() function

            {base} t : "Given a matrix or data.frame x, t returns the transpose of x" R Documentation

The other files contains basically the same parameters in fread() to load.

            file: the name of the file
            col.names: a fixes column names as (id, desc) or (activity) or (subject)
            header: FALSE (none of them has column name inside the file)
            stringsAsFactors: FALSE (facility if some string appears)
            nrows: -1 (in the production, full load) or 100 (only to test, partial load)
            drop: 1 (only to features.txt, because doesn't need the id column)
            
Step 2: Link the same type of data in one file

To facilitate the analysis, we need to link separated files, to view the data more easily. To do this, we use cbind and rbind functions.

            {base} cbind, rbind: "Take a sequence of vector, matrix or data-frame arguments and combine by columns or rows,
            respectively" R Documentation

So, we need to link:

            Train Set (FullTrain) : subject_train.txt +  y_train.txt + X_train.txt
            Test Set (FullTest)   : subject_test.txt  +  y_test.txt +  X_test.txt             

            FullTrain <- cbind(LTrain, STrain, DTrain)
            FullTest  <- cbind(LTest,  STest,  DTest)

And after, link both in one

            CompleteSet <- rbind(FullTrain, FullTest) (using rbind because all the variables already together)

            

