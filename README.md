# Getting and Cleaning Data in R

Project to Coursera Specialization - Getting and Cleaning Data

            References: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
            
            Raw Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



This file contains a detailed instruction about the technical process to Get and Clean the "Human Activity Recognition Using Smartphones" dataset (see references) using R Programming Language.

R contains many packages to facilitate the process to Get and Clean any type of Datasets, but is necessary to find the best to supply.

To start, we need to understand the rules to Get and Clean dataset to scientific analysis, explained below.

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


##Step 1: Loading

R Language has many functions to load data, but in this case, the Dataset contains ~ 100mb, so we needed a very efficient function:
            
            {data.table} fread : "Similar to read.table but faster and more convenient." R Documentation

In this dataset, some informations was allocated in different files

- Data Files: 'subject_train.txt', 'X_train.txt', 'y_train.txt', 'subject_test.txt', 'X_test.txt', 'y_test.txt'
- Description Files: 'activity_labels.txt', 'features_info.txt'  

The files 'X_train.txt' and 'X_test.txt' contains a lot of columns and we can bind the name of them direct in 'fread()'. So, we need to load 'features_info.txt' before, using the same 'fread()' function, but converting rows in columns to adjust with the parameter col.names in fread(). To do this we use t() function

            {base} t : "Given a matrix or data.frame x, t returns the transpose of x" R Documentation

The other files contains basically the same parameters in 'fread()' to load.

            file: the name of the file
            col.names: a fixes column names as (id, desc) or (activity) or (subject)
            header: FALSE (none of them has column name inside the file)
            stringsAsFactors: FALSE (facility if some string appears)
            nrows: -1 (in the production, full load) or 100 (only to test, partial load)
            drop: 1 (only to features.txt, because doesn't need the id column)
            
##Step 2: Link the same type of data in one file

To facilitate the analysis, we need to link separated files, to view the data more easily. To do this, we use 'cbind()' and 'rbind()' functions.

            {base} cbind, rbind: "Take a sequence of vector, matrix or data-frame arguments
            and combine by columns or rows, respectively" R Documentation

So, we need to link:

            Train Set (FullTrain) : subject_train.txt +  y_train.txt + X_train.txt
            Test Set (FullTest)   : subject_test.txt  +  y_test.txt +  X_test.txt             
            
            ```
            FullTrain <- cbind(LTrain, STrain, DTrain)
            FullTest  <- cbind(LTest,  STest,  DTest)
            ```
And after, link both in one

            CompleteSet <- rbind(FullTrain, FullTest) (using 'rbind()' because all the variables already together)

Remember, before begin next step, free all variables, to previne memory errors, using:

            rm(): "remove and rm can be used to remove objects." R Documentation
            
##Step 3: Filter and Transform

In this step, some information is unnecessary, so, we need to filter only columns 'Activity', 'Subject' and all other if contains words 'mean()' and 'std()':

            select(contains("activity"), contains("subject"), contains("mean()"),contains("std()"))
            
Explaining, "select()" is an function of {dplyr} package.
            
            "dplyr provides a flexible grammar of data manipulation.
            It's the next iteration of plyr, focused on tools for working 
            with data frames (hence the d in the name)." R Documentation
            
            "select() keeps only the variables you mention;" R Documentation
            
Taking advantage, we can transform informations unreadable, giving a description. Only variable we can do this is 'Activity', initially 'numeric', but using 'activity_labels.txt', we can transform.

'mutate()' is another function of {dplyr} package.

            "Mutate adds new variables and preserves existing;" R Documentation
            
and the script

            mutate(activity = as.character(ActLabels$desc[activity])

All commands described above, we can do in one single command line, using chain function '%>%' of {dplyr} package

            "These functions providing an alternative way of 
            calling dplyr (and other data manipulation) functions that you read
            can from left to right." R Documentation
            
            TidyData <- CompleteSet %>%  
                        select(contains("activity"), contains("subject"), 
                              contains("mean()"),contains("std()")) %>%
                        mutate(activity = as.character(ActLabels$desc[activity]))

##Step 4: Group and Summarize

This dataset has a lot of rows and invividually we can't analyze clearly, but using 'group_by()' and 'summarize()' calculating average value, it' easiest.

            "The group_by function takes an existing tbl and converts it
            into a grouped tbl where operations are performed 'by group'" R Documentation
            
Summarize has 2 type: 'summarize()' to individually collumn and 'summarize_each()' to many collumn simultaneously. It's our case.

            "Apply one or more functions to one or more columns. 
            Grouping variables are always excluded from modification." R Documentation
            
and the script

            Output <- TidyData %>% 
                        group_by(activity, subject) %>% 
                        summarize_each(funs(mean))

##Step 5: Saving and Going Home!

To finish our job, the data must be saved in external file and 'write.table()' do this.

            "write.table prints its required argument x 
            (after converting it to a data frame if it is not one nor a matrix) 
            to a file or connection." R Documentation
            
But, our measurement, in initial state come in this format

            2.79215504074074e-01

if write.table with default R parameters, turn in

            0.279215504074074
            
To change this, we can set some options in R, described below

            options(): "Allow the user to set and examine a variety
            of global options which affect the way in which R computes
            and displays its results." R Documentation
            
            param scipen: "scipen: integer. A penalty to be applied when deciding
            to print numeric values in fixed or exponential notation. 
            Positive values bias towards fixed and negative towards scientific
            notation: fixed notation will be preferred unless it is more than
            scipen digits wider." R Documentation
            
and the script

            options("scipen"=-100)
            write.table(Output, file = "output.txt", row.names = FALSE);
            options("scipen" = 0) # to turn back
            
            
and Going Home!
