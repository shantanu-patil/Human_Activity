
The procedure is explained in following steps:

1. The data set is downloaded from: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

2. unzipped in Dataset dir

3. Initially data is read from test dir into dataframe: TotalTest

##TotalTest <- read.table("Dataset/UCI HAR Dataset/test/x_test.txt")
##ActivityTest <- read.table("Dataset/UCI HAR Dataset/test/y_test.txt")
##subjectTest <- read.table("Dataset/UCI HAR Dataset/test/subject_test.txt")

4. same procedure is repeated for train dataset : TotalTrain

5. Both data sets are then combined into Total_Var

6. using dplyr package

7. using the chaining rule to summarize the required data: Average of each variable for each activity and each subject.