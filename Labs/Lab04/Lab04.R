# Part 1. Practice writing "for loops"
# 1. wirte a "for loop" that prints the word "hi" to the console 10 times
for(i in seq(1:10)) {
  print("hi")
}

# 2. Write a for loop that prints his total amount of money each week for the next 8 weeks
InitialMoney <- 10 # Tim has $10 in his piggy bank now
costOfGum <- 1.34 * 2 # each pack of gum cost $1.34, Tim has 2 packs each week
Allowance <- 5 # Tim gets $5 allowance each week
saving <- Allowance - costOfGum #how much money Tim will save each week
n <- 8 #total of 8 weeks

for( i in 1:n){  # calculate how much money he will have each week in the following 8 weeks
  NewMoney <- InitialMoney + saving # He save $2.32 dollars each week, allowance of $5 minus $2.68 cost of gum
  InitialMoney <- NewMoney
  cat("Tim's saving in week", i, "is", NewMoney, "\n")
}


#3. Write a for loop that calculate the population size and prints each year's size to the console
InitialPop <- 2000 #current populations size is 2000 individuals
n <- 7 # 7 years time period
for(i in 1:n){  #calculate the population size in the following 7 years
  newPop <- 0.95 * InitialPop  # the popputation size shrink by 5% each year
  InitialPop <- newPop
  cat("The population size in year", i, "is", newPop, "\n")
}


#4. Write a for loop to predit the abundance of the population 
Pre_AbundanceOfPop <- 2500 # poppulation at n1
r <- 0.8 # r is the intrinsic growth rate of the population
K <- 10000 # K is the environmental carrying capacity for the population
n <- 12 # there are 12 time steps
for(i in 2:n) {
  NewAbundanceOfPop <- Pre_AbundanceOfPop + r * Pre_AbundanceOfPop * (K - Pre_AbundanceOfPop) / K
  Pre_AbundanceOfPop <- NewAbundanceOfPop
  cat("The abundance of the population at year", i , "is", NewAbundanceOfPop, "\n")
}

# Part II. Practice writing "for loops" AND practice storing the data produced by your loops in arrays

# 5. Practice some basic of array indexing using for loops
#5a. Use the rep command to make a vector of 18 zeros
n <- 18 
Vec_1 <- rep(0, n) #made a vector that contains 18 zeros called Vec_1
Vec_1

#5b. 
n <- 18
for (i in 1:n) { #create a loop that stores the value 3 times in Vec_1
  Vec_1[i] <- i * 3  
}
Vec_1

#5c. 
n <- 18
Vec_2 <- rep(0, n) #create a Vec_2 that hold 18 zeros
Vec_2[1] <- 1 # make the first entry of Vec_2 have a value of 1
Vec_2


#5d.
n <- 18 # length of vector
myVec <- rep(1, n) 
for(i in 2:n) {
  tmp <- 1 + 2 * myVec[i - 1] #create a temp valuable to store the value
  myVec[i] <- tmp #put the temp value into myVec in its position
}
myVec


#6.use for loop to write code that makes a vector of the first 20 Fibonacci number
# where the first number is zero
n <- 18 
VecTmp <- rep(1, n) #create a temporary vector that has 18 ones
Vec <- c(0, 1, VecTmp) #crete a vector that hold 20 numbers, the first two are the first two Fibonacci numbers
for(i in 3:20) {
  tmp <- Vec[i - 2] + Vec[i - 1] #create a temporary valuable to store the value for each loop
  Vec[i] <- tmp #assign the values into Vector in each position, starting at postion 3rd.
}
Vec

#7. Redo question 4 and make a plot of the results.
Pre_AbundanceOfPop <- 2500 # poppulation at n1
r <- 0.8 # r is the intrinsic growth rate of the population
K <- 10000 # K is the environmental carrying capacity for the population
n <- 12  
time <- seq(1,n) #make a vector called "time" to stores the time steps 1 to 12
abundance <- c(2500, 2:12)#Create a vector to store 12 abundance in each time step, the first one is 2500  )
for(i in 2:12) {
  tmp <- Pre_AbundanceOfPop + r * Pre_AbundanceOfPop * (K - Pre_AbundanceOfPop) / K
  Pre_AbundanceOfPop <- tmp
  abundance[i] <- tmp
}
abundance 

plot(time, abundance) #make a plot base on time and abundance


#8a read the data into RStudio
setwd("/Users/caihong/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab04")
mydata <- read.csv("CO2_data_cut_paste.csv")

#8b















