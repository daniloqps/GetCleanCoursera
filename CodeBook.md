#Code Book of UCI HAR Dataset to Coursera Specialization Project

This file was built to describe all processes applied to get and clean a complex dataset using R Programming Language.
Below, is reproduced the property information about this dataset, copied from the original. [README.txt]() 

            Human Activity Recognition Using Smartphones Dataset
            Version 1.0
            
            Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
            Smartlab - Non Linear Complex Systems Laboratory
            DITEN - Università degli Studi di Genova.
            Via Opera Pia 11A, I-16145, Genoa, Italy.
            activityrecognition@smartlab.ws
            www.smartlab.ws

##Study Design

In synthesis, the dataset have: 

            "The features selected for this database come from the accelerometer 
            and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.". [features_info.txt]

and was collected 

            "The experiments have been carried out with a group of 30 volunteers
            within an age bracket of 19-48 years. Each person performed six
            activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
            STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
            waist. Using its embedded accelerometer and gyroscope, we captured
            3-axial linear acceleration and 3-axial angular velocity at a constant
            rate of 50Hz. The experiments have been video-recorded to label the
            data manually. The obtained dataset has been randomly partitioned into
            two sets, where 70% of the volunteers was selected for generating the
            training data and 30% the test data. " [README.txt]


## Codebook

The dataset contains 2 principals types of data:

- DTrain: Training set. [X_train.txt]()
- DTest: Test set. [X_test.txt]()

Both files contains the same columns/variables quantity with their measurement, totaling 561, described in [features.txt]()
This variables has 2 domains, indicates by prefix "t" or "f":

- Time domain signals. ex: tBodyAcc-mean()-X
- Frequency domain signals. ex: fBodyAcc-mean()-X 

and the units are:

- Accelerometer Units: standard gravity units 'g'
- Gyroscope: The units are radians/second. 

and 

            "- Features are normalized and bounded within [-1,1]." [README.txt]

The rows/observations in DTrain and DTest are different and must be linked easily since 

            "- Each feature vector is a row on the text file." [README.txt]

The dataset have 6 additional files, that complements the information about the observations

- LTrain: Training Labels [y_train.txt]() (activity identifiers 1..6 - described as WALKING...LAYING)
- LTest: Test Labels [y_test.txt]() (activity identifiers 1..6 - described as WALKING...LAYING)

- STrain: Training Subject. [subject_train.txt]() (volunteers who performed the training 1..30)
- STest:  Test Subject. [subject_test.txt]() (volunteers who performed the test 1..30)

- ActLabels: 6 Activity Labels used to describe the itens in LTrain and LTest. [activity_labels.txt]()
- Features: Name of the measurements totally 561. [features.txt]()

##Normalizing
So, to normalize the raw-data described above and turn in tidy-data, we need to follow the next steps

1. Bind the same data in only one file

            DTrain    + LTrain    + STrain = FullTrain
            DTest     + LTest     + STest  = FullTest
            FullTrain + FullTest  = AllSet

2. Combine the describe information to become more readable
            
            AllSet + ActLabels = CompleteSet

3. Select only necessary infomation to use in analysis

            extract only 'Mean()' and 'Std()' for each measurement. 

##Full Variable Description

| Subject | Type    |
|---------|---------|
| 1..30   | Integer |

| ID | Activity           | Type    |
|----|--------------------|---------|
| 1  | WALKING            | Integer |
| 2  | WALKING_UPSTAIRS   | Integer |
| 3  | WALKING_DOWNSTAIRS | Integer |
| 4  | SITTING            | Integer |
| 5  | STANDING           | Integer |
| 6  | LAYING             | Integer |


| Measurement                                            | Type    | Unit                       | Domain    | Description                                                                      |
|--------------------------------------------------------|---------|----------------------------|-----------|----------------------------------------------------------------------------------|
| timebodyaccelerometermeanx                             | Numeric | standard gravity units 'g' | Time      | Mean of Body Acceleration Signal in X axis                                       |
| timebodyaccelerometermeany                             | Numeric | standard gravity units 'g' | Time      | Mean of Body Acceleration Signal in Y axis                                       |
| timebodyaccelerometermeanz                             | Numeric | standard gravity units 'g' | Time      | Mean of Body Acceleration Signal in Z axis                                       |
| timegravityaccelerometermeanx                          | Numeric | standard gravity units 'g' | Time      | Mean of Gravity Acceleration Signal in X axis                                    |
| timegravityaccelerometermeany                          | Numeric | standard gravity units 'g' | Time      | Mean of Gravity Acceleration Signal in Y axis                                    |
| timegravityaccelerometermeanz                          | Numeric | standard gravity units 'g' | Time      | Mean of Gravity Acceleration Signal in Z axis                                    |
| timebodyaccelerometerjerkmeanx                         | Numeric | standard gravity units 'g' | Time      | Mean of Jerk Signals of Body Linear Acceleration in X axis                       |
| timebodyaccelerometerjerkmeany                         | Numeric | standard gravity units 'g' | Time      | Mean of Jerk Signals of Body Linear Acceleration in Y axis                       |
| timebodyaccelerometerjerkmeanz                         | Numeric | standard gravity units 'g' | Time      | Mean of Jerk Signals of Body Linear Acceleration in Z axis                       |
| timebodygyroscopemeanx                                 | Numeric | radians/second             | Time      | Mean of Body Gyroscope Signal in X axis                                          |
| timebodygyroscopemeany                                 | Numeric | radians/second             | Time      | Mean of Body Gyroscope Signal in Y axis                                          |
| timebodygyroscopemeanz                                 | Numeric | radians/second             | Time      | Mean of Body Gyroscope Signal in Z axis                                          |
| timebodygyroscopejerkmeanx                             | Numeric | radians/second             | Time      | Mean of Jerk Signals of Body Gyroscope Signal in X axis                          |
| timebodygyroscopejerkmeany                             | Numeric | radians/second             | Time      | Mean of Jerk Signals of Body Gyroscope Signal in Y axis                          |
| timebodygyroscopejerkmeanz                             | Numeric | radians/second             | Time      | Mean of Jerk Signals of Body Gyroscope Signal in Z axis                          |
| timebodyaccelerometermagmean                           | Numeric | standard gravity units 'g' | Time      | Mean of Magnitude of Body Acceleration Signal                                    |
| timegravityaccelerometermagmean                        | Numeric | standard gravity units 'g' | Time      | Mean of Magnitude of Gravity Acceleration Signal                                 |
| timebodyaccelerometerjerkmagmean                       | Numeric | standard gravity units 'g' | Time      | Mean of Magnitude of Jerk Signal of Body Acceleration Signal                     |
| timebodygyroscopemagmean                               | Numeric | radians/second             | Time      | Mean of Magnitude of Body Gyroscope Signal                                       |
| timebodygyroscopejerkmagmean                           | Numeric | radians/second             | Time      | Mean of Magnitude of Jerk Signal of Body Gyroscope Signal                        |
| frequencybodyaccelerometermeanx                        | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Body Acceleration Signal in X axis                                |
| frequencybodyaccelerometermeany                        | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Body Acceleration Signal in Y axis                                |
| frequencybodyaccelerometermeanz                        | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Body Acceleration Signal in Z axis                                |
| frequencybodyaccelerometerjerkmeanx                    | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Jerk Signals of Body Acceleration Signal in X axis                |
| frequencybodyaccelerometerjerkmeany                    | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Jerk Signals of Body Acceleration Signal in Y axis                |
| frequencybodyaccelerometerjerkmeanz                    | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Jerk Signals of Body Acceleration Signal in Z axis                |
| frequencybodygyroscopemeanx                            | Numeric | radians/second             | Frequency | Mean of FFT of Body Gyroscope Signal in X axis                                   |
| frequencybodygyroscopemeany                            | Numeric | radians/second             | Frequency | Mean of FFT of Body Gyroscope Signal in Y axis                                   |
| frequencybodygyroscopemeanz                            | Numeric | radians/second             | Frequency | Mean of FFT of Body Gyroscope Signal in Z axis                                   |
| frequencybodyaccelerometermagmean                      | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Magnitude of Body Acceleration Signal                             |
| frequencybodybodyaccelerometerjerkmagmean              | Numeric | standard gravity units 'g' | Frequency | Mean of FFT of Magnitude of JerkSignal of Body Acceleration Signal               |
| frequencybodybodygyroscopemagmean                      | Numeric | radians/second             | Frequency | Mean of FFT of Magnitude of Body Gyroscope  Signal                               |
| frequencybodybodygyroscopejerkmagmean                  | Numeric | radians/second             | Frequency | Mean of FFT of Magnitude of JerkSignal of Body Gyroscope Signal                  |
| timebodyaccelerometerstandarddeviationx                | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Body Acceleration Signal in X axis                         |
| timebodyaccelerometerstandarddeviationy                | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Body Acceleration Signal in Y axis                         |
| timebodyaccelerometerstandarddeviationz                | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Body Acceleration Signal in Z axis                         |
| timegravityaccelerometerstandarddeviationx             | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Gravity Acceleration Signal in X axis                      |
| timegravityaccelerometerstandarddeviationy             | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Gravity Acceleration Signal in Y axis                      |
| timegravityaccelerometerstandarddeviationz             | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Gravity Acceleration Signal in Z axis                      |
| timebodyaccelerometerjerkstandarddeviationx            | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Jerk Signals of Body Linear Acceleration in X axis         |
| timebodyaccelerometerjerkstandarddeviationy            | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Jerk Signals of Body Linear Acceleration in Y axis         |
| timebodyaccelerometerjerkstandarddeviationz            | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Jerk Signals of Body Linear Acceleration in Z axis         |
| timebodygyroscopestandarddeviationx                    | Numeric | radians/second             | Time      | Standard Deviation of Body Gyroscope Signal in X axis                            |
| timebodygyroscopestandarddeviationy                    | Numeric | radians/second             | Time      | Standard Deviation of Body Gyroscope Signal in Y axis                            |
| timebodygyroscopestandarddeviationz                    | Numeric | radians/second             | Time      | Standard Deviation of Body Gyroscope Signal in Z axis                            |
| timebodygyroscopejerkstandarddeviationx                | Numeric | radians/second             | Time      | Standard Deviation of Jerk Signals of Body Gyroscope Signal in X axis            |
| timebodygyroscopejerkstandarddeviationy                | Numeric | radians/second             | Time      | Standard Deviation of Jerk Signals of Body Gyroscope Signal in Y axis            |
| timebodygyroscopejerkstandarddeviationz                | Numeric | radians/second             | Time      | Standard Deviation of Jerk Signals of Body Gyroscope Signal in Z axis            |
| timebodyaccelerometermagstandarddeviation              | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Magnitude of Body Acceleration Signal                      |
| timegravityaccelerometermagstandarddeviation           | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Magnitude of Gravity Acceleration Signal                   |
| timebodyaccelerometerjerkmagstandarddeviation          | Numeric | standard gravity units 'g' | Time      | Standard Deviation of Magnitude of Jerk Signal of Body Acceleration Signal       |
| timebodygyroscopemagstandarddeviation                  | Numeric | radians/second             | Time      | Standard Deviation of Magnitude of Body Gyroscope Signal                         |
| timebodygyroscopejerkmagstandarddeviation              | Numeric | radians/second             | Time      | Standard Deviation of Magnitude of Jerk Signal of Body Gyroscope Signal          |
| frequencybodyaccelerometerstandarddeviationx           | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Body Acceleration Signal in X axis                  |
| frequencybodyaccelerometerstandarddeviationy           | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Body Acceleration Signal in Y axis                  |
| frequencybodyaccelerometerstandarddeviationz           | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Body Acceleration Signal in Z axis                  |
| frequencybodyaccelerometerjerkstandarddeviationx       | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Jerk Signals of Body Acceleration Signal in X axis  |
| frequencybodyaccelerometerjerkstandarddeviationy       | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Jerk Signals of Body Acceleration Signal in Y axis  |
| frequencybodyaccelerometerjerkstandarddeviationz       | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Jerk Signals of Body Acceleration Signal in Z axis  |
| frequencybodygyroscopestandarddeviationx               | Numeric | radians/second             | Frequency | Standard Deviation of FFT of Body Gyroscope Signal in X axis                     |
| frequencybodygyroscopestandarddeviationy               | Numeric | radians/second             | Frequency | Standard Deviation of FFT of Body Gyroscope Signal in Y axis                     |
| frequencybodygyroscopestandarddeviationz               | Numeric | radians/second             | Frequency | Standard Deviation of FFT of Body Gyroscope Signal in Z axis                     |
| frequencybodyaccelerometermagstandarddeviation         | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Magnitude of Body Acceleration Signal               |
| frequencybodybodyaccelerometerjerkmagstandarddeviation | Numeric | standard gravity units 'g' | Frequency | Standard Deviation of FFT of Magnitude of JerkSignal of Body Acceleration Signal |
| frequencybodybodygyroscopemagstandarddeviation         | Numeric | radians/second             | Frequency | Standard Deviation of FFT of Magnitude of Body Gyroscope  Signal                 |
| frequencybodybodygyroscopejerkmagstandarddeviation     | Numeric | radians/second             | Frequency | Standard Deviation of FFT of Magnitude of JerkSignal of Body Gyroscope Signal    |
