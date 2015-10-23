#CodeBook.md

This file was built to describe all processes applied to get and clean a complex dataset using R Programming Language.
Below, is reproduced the property information about this dataset, copied from the original [README.txt] 

            Human Activity Recognition Using Smartphones Dataset
            Version 1.0
            
            Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
            Smartlab - Non Linear Complex Systems Laboratory
            DITEN - Università degli Studi di Genova.
            Via Opera Pia 11A, I-16145, Genoa, Italy.
            activityrecognition@smartlab.ws
            www.smartlab.ws



In synthesis, the dataset have: "The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ." [features_info.txt]

The dataset contains two principals types of data:

- DTrain: Training set. [X_train.txt]
- DTest: Test set. [X_test.txt]

Both files contains the same columns/variables quantity with their measurement, totaling 561, described in [features.txt]
This variables has 2 domains, indicates by prefix "t" or "f":

- Time domain signals (ex. tBodyAcc-mean()-X )
- Frequency domain signals (ex. fBodyAcc-mean()-X )
and "- Features are normalized and bounded within [-1,1]." [README.txt]

The rows/observations in DTrain and DTest are different and must be linked easily since "- Each feature vector is a row on the text file." [README.txt]

The dataset have 5 additional files, that complements the information about the observations

- LTrain: Training Labels [y_train.txt] (activity identifiers 1..6 - described as WALKING...LAYING)
- LTest: Test Labels [y_test.txt] (activity identifiers 1..6 - described as WALKING...LAYING)
and
- STrain: Training Subject. [subject_train.txt] (volunteers who performed the training 1..30)
- STest:  Test Subject. [subject_test.txt] (volunteers who performed the test 1..30)
and
- ActLabels: 6 Activity Labels used to describe the itens in LTrain and LTest. [activity_labels.txt]

So, to normalize the raw-data described above and turn in tidy-data, we need to follow the next steps

Bind the same data in only one file

            DTrain    + LTrain    + STrain = FullTrain
            DTest     + LTest     + STest  = FullTest
            FullTrain + FullTest  = AllSet

Select only necessary infomation to use in our analysis

            extract only Mean() and Std() for each measurement. 

Combine the describe information to become more readable
            
            AllSet + ActLabels = CompleteSet



and GO!
