#Part I: Practice some simple conditionals
#1
x <- 4
if ( x < 5) {
  print("x is smaller than 5")
} else {
  print("x is bigger or equal to 5")
}


#2 import the file "ExampleDada.csv"
setwd("/Users/caihong/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab05")
mydf <- read.csv("ExampleData.csv")

#2a change every negative value to NA
myVec <- mydf$x #make a vector to get numeric data out of the data frame
for (i in 1:length(myVec)) {
  if ( myVec[i] < 0) {
    myVec[i] <- NA
  }
}
myVec
cbind(mydf$x, myVec) #check if my replacements are correct

#2b change NA (negative) values with NaN
vecNA <- is.na(myVec) #get all the NA value from myVec and store at vecNA
myVec[vecNA] <- NaN #replaced all the NA values from myVec to NaN
myVec
cbind(mydf$x, myVec) # double check all the negative values are replaced by NaN

#2c using which() to change all the NaN (negative) values with zero
VecNaN <- which(is.nan(myVec)) #find out the indexes of all the NaN values and store it as VecNaN
myVec[VecNaN] <- 0 #change all the NaN values in myVac into 0
cbind(mydf$x, myVec) #check if all the negative values become zeros

#2d how many of the values from the imported data fall in the range (50-100)
myVecOriginal <- mydf$x #rename vector from original dateframe
threshold_1 <- 50 #set up threshold_1
threshold_2 <- 100 # set up threshold_2

#method1, loops with if
nFound <- 0 # add a counter variable, count the number of value bt 50-100
for (i in 1:length(myVecOriginal)) {
  if (myVecOriginal[i] >= threshold_1 & myVecOriginal[i] <= threshold_2) {
    nFound <- nFound + 1 #increment the counter
  }
}
nFound

#method 2. Vectorized with logical indexing
numOfResults <- sum(myVecOriginal >= threshold_1 & myVecOriginal <= threshold_2)
numOfResults

#method3. vectorized with numerical indexing
numOfResults_a <- length(which(myVecOriginal >= threshold_1 & myVecOriginal <= threshold_2))
numOfResults_a

#2e create a new vector of data that has all the values fall bt 50-100
tmp <- which(myVecOriginal >= threshold_1 &  myVecOriginal <= threshold_2) #create a tmp vector to
#store all the indexes of the values fall bt 50-100
(FiftyToOneHundred <- myVecOriginal[tmp]) #put all the values bt 50-100 into a vector

#2f. use write.csv() to save vector to a file named "FiftyToOneHundred.csv"
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred")

#3. Import the data on CO2 emissions from last week's lab ("CO2_data_cut_paste.csv" from Lab04)
CO2df <- read.csv("/Users/caihong/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab04/CO2_data_cut_paste.csv")

#3a. what was the first year for which "Gas" emissions were non-zero
nonZeroThreshold <- 0 #set up 0 as threshold
tmp <- which(CO2df$Gas != nonZeroThreshold) #assign tmp as the vector to store all the postion that gas emission were !=zero
firstNonZero <- tmp[1] #the first index in tmp is the fisrt gas emission is non-zero
CO2df$Year[firstNonZero] # use the index to find the year

#3b. During which years were "Total" emissions between 200 and 300 million metric tons of carbon?
threshold_200 <- 200 #total emissions of 200 million metric tons of carbon
threshold_300 <- 300 #total emission of 300 million metric tons of carbon
allTotall <- CO2df$Total # create a vector to hold all the emissions 
emiResultIndex <- which(allTotall >= threshold_200 & allTotall <= threshold_300) #store the indexs of all the 
#of Total emission values bwteen 200 and 300
CO2df$Year[emiResultIndex]
CO2df[129, c(1, 2)] #check my work, use one of the index to see if the Total is between 200-300

#Part II loops + conditionals + biology
#1. set up parameter values
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

#2 creates more vectors
timeVec <- 1:totalGenerations #create a time vector representing time steps from 1 to totalGenerations
n <- rep(initPrey, totalGenerations)#create a vector to store the values of preps over time, 
#the initial prep # is 100
p <- rep(initPred, totalGenerations)#create a vector to store the values of predators over time

#3 write a loop that implements the calculations. 
for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  
}

#4 add if some if statements to check for negative numbers,
#then replace the negative value with zero

for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  if (n[t] < 0) {
    n[t] <- 0
  }
}

#5 make a plot of abundances of prey and predators over time
plot(timeVec, n, main = "Abundances of Prey and Predators Over Time",
                      xlab = "Time",
                      ylab = "Abundances of Prey and Predator")
lines(timeVec, p)



#6 create a matrix of my result named "myResults" with "TimeStep" in first column,
#"PreyAbundance" in second column, and "PredatorAbundance" in third column
#create a matrix called "myResults" with timeVec, n and p
myResults <- matrix(data = c(timeVec, n, p), nrow = 1000, ncol = 3)

#changed column names to myResults
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")

#write "myResults" matrix to a csv
getwd() # make sure we are still at lab05
write.csv(x = myResults, file = "PredPreyResults.csv")














