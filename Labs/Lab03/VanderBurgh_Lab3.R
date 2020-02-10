#lab step #3
# Step #3 make two varibles, one is how many bags of chips to start with, another is the guest number
chips_num <- 5
guest_num <- 8

# lab step #5 make a new variable for bags of chips eat per guest
guest_chip <- 0.4

# lab step #7 calculate the expected amount of leftover chips
chip_you <- 0.4 # you also consume 0.4 bag of chip
chips_leftover <- chips_num - guest_num * guest_chip - chip_you
chips_leftover

#lab step #8 make 4 vectors, one for each person containing their ranking
Self <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
Penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie <-c(1, 9, 5, 6, 8, 7, 2, 3, 4)

# lab step #9 acess Penny's ranking for Episode IV
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

# lab step #10 concatenate all 4 sets of ranking into a single data object
myMat <- cbind(Self, Penny, Lenny, Stewie)

# lab step# 11 use the "str" functions to inspect
str(PennyIV)
str(Penny)
str(myMat)
#"PennyIV" is a number, "Penny" give me the vector , "myMat" is a matrix

# lab step 12 making data frame using the 4 vectors of rankings
mydf_1 <- data.frame(myMat)
mydf_2 <- as.data.frame(myMat)


# lab step 13 describe the similarities and differences bwtween matrix and dataframe
dim(myMat)
dim(mydf_1)
str(myMat)
str(mydf_1)
typeof(myMat)
typeof(mydf_1)
myMat == mydf_1
#both myMat & mydf_1 dim are 9 rows and 4 columns. 
#the str are different, myMat is a matrix and mydf_1 is a dataframe
#typeof are different, myMat is "double". and mydf_1 is "list"
# the elements of these two objects are equal

# lab step #14 make a vector of the episode names as Roman numerals
episode_name <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#lab step #15 use row.names() to name the rows of the objects created in steps 10 and 12
row.names(myMat) <- episode_name
row.names(mydf_1) <- episode_name

# lab step #16 access the third row of myMat
myMat[3,]

# lab step #17 access the fourth column from mydf_1
mydf_1[, 4]

# lab step #18 access your ranking for episode V
Self[5]

# lab step#19 access Penny's ranking for episode II
Penny[2]

# lab step #20 access everyone's ranking for episode II, V and VII
mydf_1[c(4, 5, 6), ]

#lab step #21 access everyone's rankings for episode II, V, and VII
mydf_1[c(2, 5, 7), ]


#lab step #22 access rankings for just Penny and Stewie for just episodes IV and VI
mydf_1[c(4, 6), c(2, 4)]

# lab step#23 switch Lenny's rankings for episodes II and V on mydf_1
lenny_II <- 8
mydf_1[2, 3] <- lenny_II

lenny_V <- 5
mydf_1[5, 3] <- lenny_V

####line 81 and 84 are magic number, try not to use them.
### instead use indexing on the original data to obtain them


# lab step#24 use names rather than indexes to access elements
myMat["III", "Penny"]
mydf_1["III", "Penny"]



# lab step#25 use names rather than indexes to undo the switch in step 23
Lenny_II_2 <- 5
mydf_1["II", "Lenny"] <- Lenny_II_2

Lenny_V_2 <- 8
mydf_1["V", "Lenny"] <- Lenny_V_2
### see comment above magic numbers


#lab step#26 re-do the switch from step 23 using $ to access the elements
Lenny_II_3 <- 8
mydf_1$Lenny[2] <- Lenny_II_3

Lenny_V_3 <- 5
mydf_1$Lenny[5] <- Lenny_V_3

### See comment above about magic numbers

