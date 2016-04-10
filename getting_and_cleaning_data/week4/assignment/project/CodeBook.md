# Code Book

This code book summarizes the resulting data fields in `tidy.txt`.

## Identifiers

* `Subject` - The ID of the test subject
* `Activity` - The type of activity performed when the corresponding measurements were taken
 ## Activity Labels
** `WALKING` : subject was walking during the test
** `WALKING_UPSTAIRS` : subject was walking up a staircase during the test
** `WALKING_DOWNSTAIRS` : subject was walking down a staircase during the test
** `SITTING` : subject was sitting during the test
** `STANDING` : subject was standing during the test
** `LAYING` : subject was laying down during the test

## Measurements
The Measurements come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'Time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeBodyAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerometer-XYZ, FrequencyBodyAccelerometerJerk-XYZ, FrequencyBodyGyroscope-XYZ, FrequencyBodyAccelerometerJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

In Tidy.txt only Mean, STD data of above measurements are included.
Following are the measurements present in Tidy.txt
* "TimeBodyAccelerometerMeanX"
* "TimeBodyAccelerometerMeanY"                     
* "TimeBodyAccelerometerMeanZ"
* "TimeBodyAccelerometerStdX"
* "TimeBodyAccelerometerStdY"
* "TimeBodyAccelerometerStdZ"
* "TimeGravityAccelerometerMeanX"
* "TimeGravityAccelerometerMeanY"                  
* "TimeGravityAccelerometerMeanZ"
* "TimeGravityAccelerometerStdX"                   
* "TimeGravityAccelerometerStdY"
* "TimeGravityAccelerometerStdZ"                   
* "TimeBodyAccelerometerJerkMeanX"
* "TimeBodyAccelerometerJerkMeanY"                 
* "TimeBodyAccelerometerJerkMeanZ"
* "TimeBodyAccelerometerJerkStdX"                  
* "TimeBodyAccelerometerJerkStdY"
* "TimeBodyAccelerometerJerkStdZ"                  
* "TimeBodyGyroscopeMeanX"
* "TimeBodyGyroscopeMeanY"
* "TimeBodyGyroscopeMeanZ"
* "TimeBodyGyroscopeStdX"
* "TimeBodyGyroscopeStdY"
* "TimeBodyGyroscopeStdZ"
* "TimeBodyGyroscopeJerkMeanX"
* "TimeBodyGyroscopeJerkMeanY"                     
* "TimeBodyGyroscopeJerkMeanZ"
* "TimeBodyGyroscopeJerkStdX"
* "TimeBodyGyroscopeJerkStdY"
* "TimeBodyGyroscopeJerkStdZ"
* "TimeBodyAccelerometerMagnitudeMean"
* "TimeBodyAccelerometerMagnitudeStd"              
* "TimeGravityAccelerometerMagnitudeMean"
* "TimeGravityAccelerometerMagnitudeStd"           
* "TimeBodyAccelerometerJerkMagnitudeMean"          
* "TimeBodyAccelerometerJerkMagnitudeStd"          
* "TimeBodyGyroscopeMagnitudeMean"                 
* "TimeBodyGyroscopeMagnitudeStd"                  
* "TimeBodyGyroscopeJerkMagnitudeMean"              
* "TimeBodyGyroscopeJerkMagnitudeStd"              
* "FrequencyBodyAccelerometerMeanX"                 
* "FrequencyBodyAccelerometerMeanY"                
* "FrequencyBodyAccelerometerMeanZ"                 
* "FrequencyBodyAccelerometerStdX"                 
* "FrequencyBodyAccelerometerStdY"                  
* "FrequencyBodyAccelerometerStdZ"                 
* "FrequencyBodyAccelerometerMeanFreqX"             
* "FrequencyBodyAccelerometerMeanFreqY"            
* "FrequencyBodyAccelerometerMeanFreqZ"             
* "FrequencyBodyAccelerometerJerkMeanX"            
* "FrequencyBodyAccelerometerJerkMeanY"             
* "FrequencyBodyAccelerometerJerkMeanZ"            
* "FrequencyBodyAccelerometerJerkStdX"              
* "FrequencyBodyAccelerometerJerkStdY"             
* "FrequencyBodyAccelerometerJerkStdZ"              
* "FrequencyBodyAccelerometerJerkMeanFreqX"        
* "FrequencyBodyAccelerometerJerkMeanFreqY"         
* "FrequencyBodyAccelerometerJerkMeanFreqZ"        
* "FrequencyBodyGyroscopeMeanX"                     
* "FrequencyBodyGyroscopeMeanY"                    
* "FrequencyBodyGyroscopeMeanZ"                     
* "FrequencyBodyGyroscopeStdX"                     
* "FrequencyBodyGyroscopeStdY"
* "FrequencyBodyGyroscopeStdZ"                     
* "FrequencyBodyGyroscopeMeanFreqX"                 
* "FrequencyBodyGyroscopeMeanFreqY"                
* "FrequencyBodyGyroscopeMeanFreqZ"                 
* "FrequencyBodyAccelerometerMagnitudeMean"        
* "FrequencyBodyAccelerometerMagnitudeStd"          
* "FrequencyBodyAccelerometerMagnitudeMeanFreq"    
* "FrequencyBodyAccelerometerJerkMagnitudeMean"     
* "FrequencyBodyAccelerometerJerkMagnitudeStd"     
* "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq" 
* "FrequencyBodyGyroscopeMagnitudeMean"            
* "FrequencyBodyGyroscopeMagnitudeStd"              
* "FrequencyBodyGyroscopeMagnitudeMeanFreq"        
* "FrequencyBodyGyroscopeJerkMagnitudeMean"         
* "FrequencyBodyGyroscopeJerkMagnitudeStd"