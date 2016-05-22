==================================================================
# Original codebooks of the datasets (modifications are at the end of the document)
==================================================================
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universitа degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


========================================================================
========================================================================
# Codebook modifications 
========================================================================
========================================================================

Activity labels are factored, so two columns are used:
	ActivityID - numeric
	ActivityName - factor variable

Columns of the features list are factored. According to the description above and the features.txt file, their column appearance in x_test and x_train datasets is the same as their rowID in features.txt. So, features dataset uses three columns:
	FeatureID - numeric, rowID in the original dataset; non-consecutive after cutting only mean and std data
	FeatureName - factor variable, not changed from the original dataset.
	FeatureName2 - factor variable, after some tidying modifications.
	
Those modifications are:
Doubled string "BodyBody" is replaced with a single string "Body".
Word "Mean" is used, instead of "-mean()", for every feature, containing mean values.
Word "Std" is used, instead of "-std()", for every feature, containing standard deviation data.
"Acceleration" is used to mark features with acceleration data, instead of "Acc".
"Magnitude" is used to mark features with magnitude data, instead of "Mag".
"Gyroscope" is used to mark features with gyroscope data, instead of "Gyro".
Names of the features, containing time domain data, start with "time" instead of "t".
Names of the features, containing frequency domain data, start with "freq" instead of "f".

So, the finaldataset contains 69 columns:
 "ActivityID" - numeric, the ID of the activity                            
 "SubjectID"  - numeric, the ID of the subject                           
 "timeBodyAccelerationMean-X"   - numeric value, named according to the rules above;         
 "timeBodyAccelerationMean-Y"   - same as above;         
 "timeBodyAccelerationMean-Z"   - same as above;              
 "timeBodyAccelerationStd-X"   - same as above;              
 "timeBodyAccelerationStd-Y"   - same as above;               
 "timeBodyAccelerationStd-Z"    - same as above;              
 "timeGravityAccelerationMean-X"   - same as above;          
 "timeGravityAccelerationMean-Y"   - same as above;           
 "timeGravityAccelerationMean-Z"    - same as above;          
 "timeGravityAccelerationStd-X"    - same as above;          
 "timeGravityAccelerationStd-Y"     - same as above;          
 "timeGravityAccelerationStd-Z"      - same as above;         
 "timeBodyAccelerationJerkMean-X"    - same as above;        
 "timeBodyAccelerationJerkMean-Y"     - same as above;        
 "timeBodyAccelerationJerkMean-Z"     - same as above;        
 "timeBodyAccelerationJerkStd-X"      - same as above;       
 "timeBodyAccelerationJerkStd-Y"     - same as above;         
 "timeBodyAccelerationJerkStd-Z"     - same as above;         
 "timeBodyGyroscopeMean-X"          - same as above;         
 "timeBodyGyroscopeMean-Y"         - same as above;           
 "timeBodyGyroscopeMean-Z"        - same as above;            
 "timeBodyGyroscopeStd-X"         - same as above;           
 "timeBodyGyroscopeStd-Y"         - same as above;            
 "timeBodyGyroscopeStd-Z"         - same as above;            
 "timeBodyGyroscopeJerkMean-X"     - same as above;          
 "timeBodyGyroscopeJerkMean-Y"      - same as above;          
 "timeBodyGyroscopeJerkMean-Z"          - same as above;      
 "timeBodyGyroscopeJerkStd-X"           - same as above;     
 "timeBodyGyroscopeJerkStd-Y"           - same as above;      
 "timeBodyGyroscopeJerkStd-Z"          - same as above;       
 "timeBodyAccelerationMagnitudeMean"     - same as above;    
 "timeBodyAccelerationMagnitudeStd"         - same as above;  
 "timeGravityAccelerationMagnitudeMean"     - same as above;  
 "timeGravityAccelerationMagnitudeStd"     - same as above;  
 "timeBodyAccelerationJerkMagnitudeMean"    - same as above;  
 "timeBodyAccelerationJerkMagnitudeStd"     - same as above;  
 "timeBodyGyroscopeMagnitudeMean"          - same as above;  
 "timeBodyGyroscopeMagnitudeStd"            - same as above;  
 "timeBodyGyroscopeJerkMagnitudeMean"       - same as above;  
 "timeBodyGyroscopeJerkMagnitudeStd"       - same as above;  
 "freqBodyAccelerationMean-X"               - same as above;  
 "freqBodyAccelerationMean-Y"             - same as above;    
 "freqBodyAccelerationMean-Z"            - same as above;    
 "freqBodyAccelerationStd-X"             - same as above;     
 "freqBodyAccelerationStd-Y"            - same as above;      
 "freqBodyAccelerationStd-Z"            - same as above;     
 "freqBodyAccelerationJerkMean-X"       - same as above;      
 "freqBodyAccelerationJerkMean-Y"       - same as above;      
 "freqBodyAccelerationJerkMean-Z"       - same as above;     
 "freqBodyAccelerationJerkStd-X"        - same as above;      
 "freqBodyAccelerationJerkStd-Y"        - same as above;      
 "freqBodyAccelerationJerkStd-Z"        - same as above;     
 "freqBodyGyroscopeMean-X"              - same as above;      
 "freqBodyGyroscopeMean-Y"              - same as above;      
 "freqBodyGyroscopeMean-Z"             - same as above;      
 "freqBodyGyroscopeStd-X"                - same as above;     
 "freqBodyGyroscopeStd-Y"               - same as above;      
 "freqBodyGyroscopeStd-Z"               - same as above;     
 "freqBodyAccelerationMagnitudeMean"      - same as above;    
 "freqBodyAccelerationMagnitudeStd"       - same as above;    
 "freqBodyAccelerationJerkMagnitudeMean"   - same as above;  
 "freqBodyAccelerationJerkMagnitudeStd"     - same as above;  
 "freqBodyGyroscopeMagnitudeMean"           - same as above;  
 "freqBodyGyroscopeMagnitudeStd"              - same as above;  
 "freqBodyGyroscopeJerkMagnitudeMean"       - same as above;  
 "freqBodyGyroscopeJerkMagnitudeStd"        - same as above;  
 "ActivityName" 		 - factor variable, corresponding to ActivityID.
 
 The finalAvg dataset contains four columns:
 SujectID - factor variable, as in the finaldataset.
 ActivityName - factor variable, as in the finaldataset.
 Variable  - factor variable, matching a column from finaldataset.
 mean(value) - numeric variable, the result of the aggregation.
