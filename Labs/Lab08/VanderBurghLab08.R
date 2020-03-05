#Lba08: Documentation and Metadata

############################################################################
# 3b. Use the code from Week4's lab problem #7, turn the logistic growth
# model code into a function that takes r(the intrinsic growth rate),
# K (the carrying capacity), the total number of generations, and
# the initial population size as it arguments.

logisticGrowthFun <- function(r, K, n, initialPop) {
  r <- 0.8 # r is the intrinsic growth rate of the population
  K <- 10000 # K is the environmental carrying capacity for the population
  abundance <- rep(initialPop, n) # create a vector to store n number times of abundance, 
  # n replicate of initialPop
  for (i in 2:n) {
    abundance[i] <- abundance[i - 1] + r * abundance[i - 1] * (K - abundance[i - 1])/K
  } 
  return(abundance)
}

# test if my function works
logisticGrowthFun(0.8, 10000, 13, 2500)

######################################################################################
# 3c Add code to the function so that it produces a plot of the data it generates

logisticGrowthFun <- function(r, K, n, initialPop) {
  r <- 0.8 # r is the intrinsic growth rate of the population
  K <- 10000 # K is the environmental carrying capacity for the population
  abundance <- rep(initialPop, n) # create a vector to store n number times of abundance, 
  # n number of initialPop
  time <- seq(1,n) #make a vector called "time" to stores the time steps 1 to n
  for (i in 2:n) {
    abundance[i] <- abundance[i - 1] + r * abundance[i - 1] * (K - abundance[i - 1])/K
  } 
  myPlot <- plot(time, abundance) #make a plot base on time and abundance
  return(myPlot)
}

# test if my function works
logisticGrowthFun(0.8, 10000, 13, 2500)

# save the examplePlt as PDF (note, default is in inches)
pdf(file = "examplePlot.pdf",
    width = 10, height = 10)
logisticGrowthFun(0.8, 10000, 13, 2500)
dev.off()


######################################################################################
# 3d following the function, write a lines of code that calls the function, choose you own 
# parameter values

logisticGrowthFun(0.9, 10000, 15, 1000)

######################################################################################
# 3e write a line(s) of code that writes the data set to a file(also in your Lab08 directory),
# The data file should have two columns: the first column should be "generation", and the second
# column should be "abundance".
r <- 0.8 # r is the intrinsic growth rate of the population
K <- 10000 # K is the environmental carrying capacity for the population
n <- 12  
generations <- seq(1,n) #make a vector called "time" to stores the time steps 1 to 12
abundance <- c(2500, 2:12)#Create a vector to store 12 abundance in each time step, the first one is 2500  )
for(i in 2:12) {
  abundance[i] <- abundance[i - 1] + r * abundance[i - 1] * (K - abundance[i - 1])/K
}

mydf <- data.frame(generations, abundance) # create a new dataframe

setwd("/Users/caihong/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab08")
write.csv(mydf, "/Users/caihong/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab08/logisticDataFrame.csv")






