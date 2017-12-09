#read names of features
names <- read.delim('features.txt',header = FALSE,sep = '')

#read activity labels 
labels <- read.delim('activity_labels.txt',header = FALSE,sep = '')

#read test dataset
test <- read.delim('test/X_test.txt',header = FALSE,sep = '')
#read activity column for test dataset
test_labels <- read.delim('test/y_test.txt',header = FALSE,sep = '')
#read subjects column for test dataset
test_subject <- read.delim('test/subject_test.txt',header = FALSE,sep = '')

#read train dataset
train <- read.delim('train/X_train.txt',header = FALSE,sep = '')
#read activity column for train dataset
train_labels <- read.delim('train/y_train.txt',header = FALSE,sep = '')
#read subjects column for train dataset
train_subject <- read.delim('train/subject_train.txt',header = FALSE,sep = '')

#merge train and test datasets
ds <- rbind(train, test)

#free up memory
rm(test,train)

#merge actifity columns for train and test datasets
activities <- rbind(labels[train_labels[,1],],labels[test_labels[,1],])
#merge subjects columns for train and test datasets
subjects <- rbind(train_subject,test_labels)

#select features that are either mean or std values
need_columns <- grep('mean\\(\\)|std\\(\\)',names[,2])
ds <- ds[,need_columns]

#add subjects and activities columns
ds <- cbind(ds,subjects[,1])
ds <- cbind(ds,activities[,2])

#prettify feature names - all lower case, alphanumeric characters
nice_names <- append(as.vector(names[need_columns,2]),c('subject','activity'))
nice_names <- tolower(nice_names)
nice_names <- gsub('[\\(,-\\)]','',nice_names)

#apply new pretty column names
names(ds) <- nice_names

#create an independent tidy data set with 
#the average of each variable for each activity and each subject
means <- aggregate(x = ds[1:(length(nice_names)-2)],by = ds[c('subject','activity')],FUN=mean)


