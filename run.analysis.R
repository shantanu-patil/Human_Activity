
## Reading Dataset

dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, "Dataset.zip")
unzip("Dataset.zip", exdir = "Dataset")

## Extracting data from test

TotalTest <- read.table("Dataset/UCI HAR Dataset/test/x_test.txt")
TotalTest$id <- c(1:2947)
ActivityTest <- read.table("Dataset/UCI HAR Dataset/test/y_test.txt")
ActivityTest$id <- c(1:2947)
SubjectTes <- read.table("Dataset/UCI HAR Dataset/test/subject_test.txt")
SubjectTes$id <- c(1:2947)

names(ActivityTest) <- c("Activity","id")
names(subjectTest) <- c("Subject","id")

TotalTest1 <- merge(ActivityTest,TotalTest, by ="id", all=T)
TotalTest2 <- merge(subjectTest,TotalTest1, by ="id", all=T)

TotalTest2$Activity[TotalTest2$Activity %in% "1"] <- "WALKING"
TotalTest2$Activity[TotalTest2$Activity %in% "2"] <- "WALKING_UPSTAIRS"
TotalTest2$Activity[TotalTest2$Activity %in% "3"] <- "WALKING_DOWNSTAIRS"
TotalTest2$Activity[TotalTest2$Activity %in% "4"] <- "SITTING"
TotalTest2$Activity[TotalTest2$Activity %in% "5"] <- "STANDING"
TotalTest2$Activity[TotalTest2$Activity %in% "6"] <- "LAYING"

## Extracting data from train

TotalTrain <- read.table("Dataset/UCI HAR Dataset/train/x_train.txt")
TotalTrain$id <- c(1:2947)
ActivityTrain <- read.table("Dataset/UCI HAR Dataset/train/y_train.txt")
ActivityTrain$id <- c(1:2947)
SubjectTrain <- read.table("Dataset/UCI HAR Dataset/train/subject_train.txt")
SubjectTrain$id <- c(1:2947)

names(ActivityTrain) <- c("Activity","id")
names(subjectTrain) <- c("Subject","id")

TotalTrain1 <- merge(ActivityTrain,TotalTrain, by ="id", all=T)
TotalTrain2 <- merge(subjectTrain,TotalTrain1, by ="id", all=T)

TotalTrain2$Activity[TotalTrain2$Activity %in% "1"] <- "WALKING"
TotalTrain2$Activity[TotalTrain2$Activity %in% "2"] <- "WALKING_UPSTAIRS"
TotalTrain2$Activity[TotalTrain2$Activity %in% "3"] <- "WALKING_DOWNSTAIRS"
TotalTrain2$Activity[TotalTrain2$Activity %in% "4"] <- "SITTING"
TotalTrain2$Activity[TotalTrain2$Activity %in% "5"] <- "STANDING"
TotalTrain2$Activity[TotalTrain2$Activity %in% "6"] <- "LAYING"

## Binding both the datasets in one dataset

Total_Var <- rbind(TotalTest2,TotalTrain2)

## selecting only variables that are required,arranging in ascending order by Subject, then grouping them by Subject and Activity, and finally summarizing the average for mean and std

Total_Var1<- Total_Var %>% select(matches("(Subject)+|(Activity)+|(mean)+|(std)+", ignore.case = FALSE)) %>% arrange(Subject) %>% group_by(Subject,Activity) %>% summarize(mean("(mean)|(std)"))









