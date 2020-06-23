#Get and Cleaning Data Course Project

The project that aims to fulfill final course work

## How It Works

The script consists of:

- Open the file features.txt and save it to the data frame df_features

- Open the activity_labels.txt file and save it to the data frame df_activity_labels

- Open the file X_test.txt and save it in the data frame df_X_test

- Open the file y_test.txt and save it in the data frame df_y_test

- Join the df_X_test and df_y_test data frames in the df_test data frame

- Open the file X_train.txt and save it in the data frame df_X_train

- Open the file y_train.txt and save it in the data frame df_y_train

- Join the df_X_train and df_y_train data frames in the df_train data frame

- Insert the df_test data frame in the df_train data frame, generating the df_complete

- Filter the columns that are average and std, generating the df_filtered

- Join the df_filtered data frames with df_activity_labels through the "NumberLabel" column, generating df_final

- Group the df_final by the average, generating the df_aggregated

- generate .txt using write.table