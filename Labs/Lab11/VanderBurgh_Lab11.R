########## Part1: getting set up to work with the data

#Load library
library(tidyverse)

#import data into RStudio
woodDesityDF <- read.csv("/Users/caihong/Desktop/EBIO4420/CompBioLabsAndHomework/Labs/Lab11/GlobalWoodDensityDatabase.csv", stringsAsFactors = F)
head(woodDesityDF)

#rename the desity column name because it is too long
names(woodDesityDF)[names(woodDesityDF) == "Wood.density..g.cm.3...oven.dry.mass.fresh.volume"] <- "woodDesity"

########## Part II: Working with desity data

# removing rows with missing data
# 4a which row is it? 
naEntry <- which(is.na(woodDesityDF$woodDesity))
# row 12150 woodDesity==NA
naEntry
# 4b remove that row from the data frame
woodDesityDF <- subset(woodDesityDF, Number != "12150")
# double check to see if NA is gone
naEntry <- which(is.na(woodDesityDF$woodDesity))
naEntry

# 5. Dealing with one kind of pseudo-replication
# creat a new data frame with each species listed only once
# has the Family and Binomal info for each species, and 
# has the mean of the Density measurements for each species
speciesFamilyDensity_df <- woodDesityDF %>% 
  group_by(Binomial, Family) %>%
  summarise(Density = mean(woodDesity), n = n())

# 6. Contrasting most and least dense families
# which families of tress have the greatest and least densities? 
# 6a. Make a new data frame that has the average density for each Family
# (no longer has individual species)
familyDensity_df <- speciesFamilyDensity_df %>%
  group_by(Family) %>%
  summarise(MeanDensity = mean(Density), n = n())
# 6b. Sort the result of problem by MeanDensity
sort_familyDensity_df <- arrange(familyDensity_df, MeanDensity)
# 6c. Using the results from problem 6b
# what are the 8 families with the highest average densities?
top8Families <- tail(sort_familyDensity_df, 8)
# what are the 8 families with the lowest average densities?
low8Families <- head(sort_familyDensity_df, 8)

######## Part III Plotting
library(ggplot2)
# 7 Plotting densities of most and least families with facets
top8Families_df <- as.data.frame(top8Families)
ggplot(data = top8Families_df) +
  geom_boxplot(mapping = aes(Family, MeanDensity)) +
  face
