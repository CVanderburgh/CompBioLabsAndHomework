#Lab 09: Parsing Dates and Times from a Real Data File

############################################################################################
#Import the camera trap data file
camData <- read.csv("/Users/caihong/Desktop/EBIO4420/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# Problem#1 cobvert the dates and times into actual objects that represent time instead of character strings
# Look at the structure of the dataframe
str(camData)

# Use strptime to solve problem #1, try on a small size, create a new varible
oneDate <- camData$DateTime[1]
newOneData <- strptime(oneDate, format = '%d/%m/%Y %H:%M')

# Use strptime on the whole vector of DateTime
newDateTime <- strptime(camData$DateTime, format = '%d/%m/%Y %H:%M')

# Replace the old DateTime column values with newDataTime(split dates and times) values
camData[["DateTime"]] <- newDateTime
tail(camData) # the last entry has 2 digit year format
### This method will not solve the 2 digit year problem


############################################################################################
# Use lubridate to solve problem 1
#Import the camera trap data file again to start over
camDataWithLubridate <- read.csv("/Users/caihong/Desktop/EBIO4420/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# Install "lubridate package and Load library
# install.packages("lubridate")
library(lubridate)

# Use libridate on a small size, create a new varible
sampleDate <- camDataWithLubridate$DateTime[1]
sampleDate <- dmy_hm(sampleDate)

# Use lubridate on the whole DateTime vector
seperateDateTime <- dmy_hm(camDataWithLubridate$DateTime)

# Replace DateTime column values with seperateDateTime values
camDataWithLubridate[["DateTime"]] <- seperateDateTime
tail(camDataWithLubridate)
### This method automatically solved the two digit problem for problem#2


############################################################################################
# Problem#2 
# create a vector to store all the internal form of DateTime
internalDate <- as.numeric(camData$DateTime)
# create a threshold that is 0, anything less than 0 are the 2 digit year format
# dates in R are stored internally as the fractional number of days from January 1, 1970
threshold <- 0
# create myVec to store all the values that has 2 digit format
myVec <- internalDate < threshold
# check how many of the values has 2 digit format, which is 5645 entries
sum(myVec)

############################################################################################
# Problem #3
# use the mehtods from problems 1 with base R and problem 2 to creat an Accurate vector of dates and times

# create a vector to store the position of 2 digit year
twoDigitPosition <- which(internalDate < threshold)

# create a vector to store the 2 digit into 4 digit year format
twoDigitToFour <- format(camData$DateTime[twoDigitPosition], "20%y/%m/%d %H:%M:%S") 

# replace the DataTime column where all the 2 digit year format into 4 digit year format
camData$DateTime[twoDigitPosition] <- twoDigitToFour

# check if there is any 2 digit year form left, which is zero, no more two digit format year.
sum(as.numeric(camData$DateTime) < 0)

############################################################################################







