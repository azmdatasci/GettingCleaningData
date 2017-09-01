Description of the magnitudes
=============================

The assignment uses data from the accelerometer and gyroscope 3-axial raw signals
tAcc-XYZ and tGyro-XYZ. The signals were captured at 
a constant rate of 50 Hz and they were filtered using a median filter and low pass 
filter to remove noise. The acceleration signal was separated into body and gravity 
acceleration signals: 
tBodyAcc-XYZ -> TimeBodyAcceleration-XYZ (in the tidy data set)
tGravityAcc-XYZ -> Time GravityAcceleration-XYZ
Another low pass filter was used here (for more details about the filtering process 
read 'feature_info.txt'). 

Subsequently, the body linear acceleration and angular velocity were derived to 
obtain Jerk signals
tBodyAccJerk-XYZ -> TimeBodyAccelerationJerk-XYZ
tBodyGyroJerk-XYZ -> TimeBodyGyroscopeJerk-XYZ

The magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) of certain features were done
fBodyAcc-XYZ -> FrequencyBodyAcceleration-XYZ
fBodyAccJerk-XYZ -> FrequencyBodyAccelerationJerk-XYZ
fBodyGyro-XYZ -> FrequencyBodyGyroscope-XYZ
fBodyAccJerkMag -> FrequencyBodyAccelerationJerkMagnetic
fBodyGyroMag -> FrequencyBodyGyroscopeMagnetic
fBodyGyroJerkMag -> FrequencyBodyGyroscopeJerkMagnetic

For each magnitude the mean value (Mean) and the standard deviation (Std) are 
provided.

