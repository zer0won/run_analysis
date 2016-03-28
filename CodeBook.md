CodeBook
===================

This file described how to replicate the results presented in this repository. The R code for the is all presented in the file [run_analysis.R](/run_analysis.R).

Data
-----------------
The file [run_analysis.R](/run_analysis.R) assumes that the content of the ZIP file has been extracted to the working directory.

After downloading the ZIP file, it needs to be manually unzipped, so that the contents of the ZIP file are placed in a folder called "UCI HAR Dataset" within the working directory. 

After extracting the content of the ZIP file to the ./UCI HAR Dataset folder inside the working directory, the [run_analysis.R](/run_analysis.R) script can be executed.

Transformations
------------------
In this section the transformation which are applied to the data are described. The steps below correspond to the steps in the [run_analysis.R](/run_analysis.R) file (preceded by a double hash '##').

1. Import the data from the text files
2. Rename the variables and observations
3. Add a variable 'type' classifying every observation as 'training' or 'test'
4. Merge the data frames
5. Save the complete merged data frame to imported.RData (excluded from Git because of its size)
6. Subset the data frame using regular expressions, the criteria is that the variable name contains: 'type', 'activity', 'mean' or 'std' (standard deviation)
7. Save the resulting data frame to [final.RData](/final.RData)
8. Calculate the mean for each variable and write this to a new data frame
9. Save the new data frame as [means.RData](/means.RData)
10. Export the data frame to a tab-delimited text file ([means.txt](/means.txt))

Variables
-------------------
In the first data set ([final.RData](/final.RData)) the variables are:

1. type, training or test
2. activity, walking, standing, etc.
3. all other variables are measurement from the gyroscope and accelerometer


In the second data ([means.RData](/means.RData)/[means.txt](/means.txt)) the variables are:

1. Measurement, the name of measurement, corresponding to the variables under (3.) from the first data set ([final.RData](/final.RData)).
2. Mean, the mean value observed for each measurement