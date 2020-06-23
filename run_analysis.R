## Open the file features.txt and save it to the data frame df_features
## Open the activity_labels.txt file and save it to the data frame df_activity_labels
df_features_names <- read.csv("./features.txt", sep="", header=F)
df_activity_labels <- read.csv("./activity_labels.txt", sep="", header=F, col.names = c("NumberLabel", "Label"))

features_names <- as.vector(t(df_features_names["V2"])) 

## Open the file X_test.txt and save it in the data frame df_X_test
## Open the file y_test.txt and save it in the data frame df_y_test
df_X_test <- read.csv('./test/X_test.txt', header=FALSE, sep="", col.names = features_names)
df_y_test <- read.csv('./test/y_test.txt', header=FALSE, sep="", col.names = c("NumberLabel"))

## df_X_test and df_y_test data frames in the df_test data frame
df_test <- df_X_test
df_test$NumberLabel <- df_y_test

## Open the file X_train.txt and save it in the data frame df_X_train
## Open the file y_train.txt and save it in the data frame df_y_train
df_X_train <- read.csv('./train/X_train.txt', header=FALSE, sep="", col.names = features_names)
df_y_train <- read.csv('./train/y_train.txt', header=FALSE, sep="", col.names = c("NumberLabel"))

## Join the df_X_train and df_y_train data frames in the df_train data frame
df_train <- df_X_train
df_train$NumberLabel <- df_y_train

## Insert the df_test data frame in the df_train data frame, generating the df_complete
df_complete <- dplyr::bind_rows(df_train, df_test)

## Filter the columns that are average and std, generating the df_filtered
filtered_columns<-grep("(mean|std|NumberLabel)", names(df_complete))
df_filtered <- df_complete[filtered_columns]

## Join the df_filtered data frames with df_activity_labels through the "NumberLabel" column, generating df_final
df_filtered$NumberLabel = df_filtered$NumberLabel[,1]
df_final<-dplyr::left_join(df_filtered, df_activity_labels, by="NumberLabel")

## Group the df_final by the average, generating the df_aggregated
df_aggregated <- aggregate(df_final, by=list(Label=df_final$Label, NumberLabel=df_final$NumberLabel), FUN=mean)

## generate .txt using write.table
write.table(df_aggregated, file="data_aggregated.txt")