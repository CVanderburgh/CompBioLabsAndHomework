# Lab07: Put the FUN in FUNction!

# Writing your own functions, Part 1

# Problem #1
# when given a base and a height of an triangle
triangleArea <- function(base, height) {
  myTriArea <- 0.5 * base * height
  return(myTriArea)
}

# Demonstrate my function works by calling it for an imaginary triangle that has 
# a base of 10 units and a height of 9 units
imageTriangleArea <- triangleArea(10, 9)
imageTriangleArea


# Problem #2 
# Part2a :Write a function named myAbs() that calculates and returns absolute value
# when given a number, always return with the absolute value of the number

myAbs <- function(number) {
  if (number > 0) {
    return(number)
  } else {(return(-number))
  }
}

# Demonstrate my function by using it on 5 & -2.3
myAbs(5)
myAbs(-2.3)  

# Part2b. Reivse my function to make it work on vectors
# given any number or vector
myAbs <- function(number) {
  for (i in 1:length(number)) {
    if (number[i] >= 0) {
      number[i] <- number[i]
    } else {number[i] <- -number[i]
    }
  }
  return(number)
}
myAbs(c(1.1, 2, 0, -4.3, 9, -12))


# Problem #3 write a function that returns a vector of the first n Fibonacci numbers,
# where n is any integer >= 3
# given a=0 or 1, n >=3
myFibonacci <- function(a, n) {
  myFibonacciResults <- rep(a, n)
  if (a == 0) {
    myFibonacciResults[2] <- 1
  }
  for (i in 3:n) {
    myFibonacciResults[i] <- myFibonacciResults[i - 2] + myFibonacciResults[i - 1]
  }
  return(myFibonacciResults)
}

#Test out to see if my function works
myFibonacci(1, 20)

# Bonus 3a, make my function work for n=1 and n = 2
myFibonacci <- function(a, n) {
  myFibonacciResults <- rep(a, n)
  if (a == 0) {
    myFibonacciResults[2] <- 1
  }
  if (n == 1) {
    myFibonacciResults <- 0
  }
  if (n == 2) {
    myFibonacciResults <- c(0, 1)
  } else {
  for (i in 3:n) {
    myFibonacciResults[i] <- myFibonacciResults[i - 2] + myFibonacciResults[i - 1]
  }
  return(myFibonacciResults)
}
}
# Test my function, it doesn't work.Not sure why????
#"Error in myFibonacciResults[i] <- myFibonacciResults[i - 2] + myFibonacciResults[i -  : 
# replacement has length zero
myFibonacci(1, 1)

# Bonus 3b make my function check user input
myFibonacci <- function(a, n) {
  myFibonacciResults <- rep(a, n)
  if (a != 0 | a != 1) {
    stop("The 'a' argument must be 0 or 1")
  }
  if (a == 0) {
    myFibonacciResults[2] <- 1
  }
  for (i in 3:n) {
    myFibonacciResults[i] <- myFibonacciResults[i - 2] + myFibonacciResults[i - 1]
  }
  return(myFibonacciResults)
}

myFibonacci(0, 20)
####it didn't work neither!!!!


# Problem #4a: write a function that takes two numbers as its argements and returns the square of the 
#difference between them. 

# given any two numbers x & y, returns (x - y) ^ 2
mySqureDiff <- function(x, y) {
  mySqureDiffResult <- (x - y) ^ 2
  return(mySqureDiffResult)
}

# demonstrate my functions works by calling it with the numbers 3 and 5
mySqureDiff(3, 5)

# call your function where the first argument is c(2, 4, 6), and the second argument is 4
mySqureDiff(c(2, 4, 6), 4)

# Part4b. write a function to calculate the average of a vector of numbers
# given any vector of numbers, return the average
myMean <- function(anyVector) {
  #first get the sum
  mySum <- sum(anyVector)
  #use the sum/the length of any Vector
  myMeanResult <- mySum/length(anyVector)
  return(myMeanResult)
}

# demonstrate that my function works
myMean(c(5, 15, 10))

# Demonstrate that my function works by calling it with the data 
# in the "DataForLab07.csv" file found in Sam's Lab07 directory.
mydf <- read.csv("/Users/caihong/Desktop/EBIO4420/compBioSandbox/CompBio_on_git/Labs/Lab07/DataForLab07.csv")
myMean(mydf$x)

# Part 4c Write a function that calculates and returns the sum of squares as defined here. 
# my function should take a vector of numeric data as its argument.
#for any given vector of number, calculates and returns the sum of squares

mySumSquare <- function(anyVec) {
  # use myMean to calculate the mean from the vector
  myMeanResult <- myMean(anyVec)
  #use mySquareDiff calculate the square differece beween mean and each datapoint
  mySqureDiffResult <- mySqureDiff(anyVec, myMeanResult)
  #sum all my SquareDiffResult
  mySumSquareResult <- sum(mySqureDiffResult)
  return(mySumSquareResult)
}

#demonstrate that my function works
mySumSquare(mydf$x)





























