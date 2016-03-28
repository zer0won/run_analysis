setwd("C:/Users/clevy/Google Drive/R")

## Step 1
# read the data
features <- read.table("./UCI HAR Dataset/features.txt")
features <- t(features[2])
features <- tolower(features)
features <- gsub("-", "", features)
features <- gsub(",", "", features)
features <- gsub("\\(", "", features)
features <- gsub("\\)", "", features)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Step 2
# label the variables and observations
labs <- read.table("./UCI HAR Dataset/activity_labels.txt")
labs <- as.character(labs$V2)
labs <- tolower(labs)
y_train <- as.data.frame(factor(y_train$V1, levels=c(1,2,3,4,5,6), labels=labs) )
y_test <- as.data.frame(factor(y_test$V1, levels=c(1,2,3,4,5,6), labels=labs) )
names(y_train) <- "activity"
names(y_test) <- "activity"
names(X_train) <- features
names(X_test) <- features

## Step 3
# add activity variable type with value train
type <- "train"
names(type) <- "type"

## Step 4
# merge the train dataframe
train <- as.data.frame(c(type, y_train, X_train) )


# add activity variable type with value test
type <- "test"
names(type) <- "type"

# merge the test dataframe
test <- as.data.frame(c(type, y_test, X_test) )


# merge the train and test data frames
imported <- rbind(train, test)

## Step 5
# save the workspace
save(imported, file = "./UCI HAR Dataset/run_analysis/imported.RData")


## Step 6
# subset based on variable names
final <- subset(imported, 
                select = grep(
                  "mean|std",
                  ls(imported)
                )
)

## Step 7
# save the final dataset
save(final, file = "./UCI HAR Dataset/run_analysis/final.RData")


## Step 8
# create a data frame with the means
# the first two rows contain string and are skipped
means <- as.vector(sapply(final, mean))
names <- names(final)
means <- as.data.frame(cbind(names, means))
names(means) <- c("variable", "mean")



## Step 9
# save the result
save(means, file = "./UCI HAR Dataset/run_analysis/means.Rdata" )

## Step 10
# export the result
write.table(means, file = "./UCI HAR Dataset/run_analysis/means.txt", sep = "\t", row.names=FALSE)




# Clean-up
rm(labs)
rm(features)
rm(y_train)
rm(X_train)
rm(y_test)
rm(X_test)
rm(type)
rm(train)
rm(test)
rm(imported)
rm(names)
rm(final)
rm(means)
