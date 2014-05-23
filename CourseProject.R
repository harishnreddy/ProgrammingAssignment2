
#GETTING AND CLEANING DATA
#COURSE PROJECT

#THIS RScript takes wearable data as the input and then
#summarizes it by subject and activity into one data set

#set working directory

setwd("/Users/harishreddy/Google Drive/Coursera/GettingAndCleaningData/CourseProject")

#STEP 1 -> LOAD DATA, MERGE TEST AND TRAIN DATA SETS, CLEAN UP COLUMN NAMES

#load and clean test and training data

#subject
subject_test <- read.table("../UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("../UCI HAR Dataset/train/subject_train.txt")
subject <- rbind (subject_test, subject_train)

#activity
y_test <- read.table("../UCI HAR Dataset/test/Y_test.txt")
y_train <- read.table("../UCI HAR Dataset/train/Y_train.txt")
y <- rbind(y_test, y_train)

#this is the measurement data (from feature.txt)
x_test <- read.table("../UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("../UCI HAR Dataset/train/X_train.txt")
x <- rbind(x_test, x_train)

#get all column names with mean() in it
#get all column names with std() in it

#subset on appropriate columns
x <- x[ ,c(1,2,3,4,5,6)]

1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
559 angle(X,gravityMean)
560 angle(Y,gravityMean)
561 angle(Z,gravityMean)


#bind all of the columns together
test_data <- cbind(subject, y, x)

#rename the columns

colnames(test_data) <- c('subject',
                         'activity',
                         'tBodyAccMeanX',
                         'tBodyAccMeanY',
                         'tBodyAccMeanZ',
                         'tBodyAccStdX',
                         'tBodyAccStdY',
                         'tBodyAccStdZ')

#STEP 2 - CREATE NEW TIDY DATA SET 

#NEED TO GROUP BY SUBJECT AND ACTIVITY AND TAKE THE MEAN

table(test_data$subject,test_data$activity)

max(test_data$subject)

#CREATE NEW TIDY DATA SET

tidyDF <- data.frame()

#subject,activity,meanA,meanB, ...

for (i in 1:max(test_data$subject)) {
  for (j in 1:max(test_data$activity))  {
    
    
    tBodyAccMeanX <- (mean(t$tBodyAccMeanX))
    tBodyAccMeanY <- (mean(t$tBodyAccMeanY))
    tBodyAccMeanZ <- (mean(t$tBodyAccMeanZ))
    
    
    newLineDF <- data.frame(subject = i, 
                            activity = j, 
                            tBodyAccMeanX = tBodyAccMeanX,    
                            tBodyAccMeanY = tBodyAccMeanY,    
                            tBodyAccMeanZ = tBodyAccMeanZ )    
#now rowbind it
    
    tidyDF <- rbind(tidyDF, newLineDF)
    
    
  #  t <- subset(test_data,test_data$subject==i & test_data$activity==j)
    
   # tBodyAccMeanX <- (mean(t$tBodyAccMeanX))
  #  tBodyAccMeanY <- (mean(t$tBodyAccMeanY))
  #  tBodyAccMeanZ <- (mean(t$tBodyAccMeanZ))
    
    #rbind the variables into one data frame
    
#    'tBodyAccMeanX',
 #   'tBodyAccMeanY',
  #  'tBodyAccMeanZ',
#    'tBodyAccStdX',
 #   'tBodyAccStdY',
  #  'tBodyAccStdZ'
    
    
#        print(dim(t))
    
  print (i)
#print(dim())
 # print(j)
}
}

#this is the activity being performed
#1 - WALKING
#2 - WALKING UPSTAIRS
#3 - WALKING DOWNSTAIRS
#4 - SITTING
#5 - STANDING
#6 - LAYING


#feature vector -> variables described in feature.txt
#1 tBodyAcc-mean()-X
#2 tBodyAcc-mean()-Y
#3 tBodyAcc-mean()-Z
#4 tBodyAcc-std()-X
#5 tBodyAcc-std()-Y
#6 tBodyAcc-std()-Z
#- eventually add other columns



##########