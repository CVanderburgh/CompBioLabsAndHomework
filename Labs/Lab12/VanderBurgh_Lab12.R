###### Lab 12: Choose your own advendure!######


# Problem 1: A bar plot in ggplot()
library(ggplot2)
# Write code using ggplot() that makes a plot based upon the Cusack et al. data

# Read in data file
myDf <- read.csv("/Users/caihong/Desktop/EBIO4420/Practice/CusackData/Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# crosstabulation with Species information
allSpeices <- with(myDf, table(Species))
ftable(allSpeices)
allSpeicesDf <- as.data.frame(allSpeices) # a new df with species and frequnecy counts
colnames(allSpeicesDf) <- c("Species", "count") #add columns names

# Make a bar plot
basic_bp <- ggplot(data = allSpeicesDf) +
  geom_bar(mapping = aes(x = Species, y = count), stat = "identity")

# Problem 2: Rotate the axis tick labels. 
bp_rotate <- basic_bp +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# Problem 3: A different orientation, scaling, and sorting
ggplot(allSpeicesDf) +
  geom_bar(mapping = aes(x = reorder(Species, -count), y = count), stat = "identity") + # reorder the x axis based on count
  scale_y_log10() + #change the y axis scale
  labs(x = "Species", y = "Count") + # change the axis labels
  coord_flip()  # flip the table
  
  

 









