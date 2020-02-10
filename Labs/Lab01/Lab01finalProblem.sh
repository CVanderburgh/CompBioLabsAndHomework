cut -f 2-4 -d, PredPreyData.csv > PredPreyData_cut.csv
cat PredPreyData_cut.csv | head -1 && cat PredPreyData_cut.csv | tail -10



### A better version after Sam's feedback
cut -f 2-4 -d, PredPreyData.csv > PredPreyData_cut.csv #cut the first column and store it into a temporarily file
cat PredPreyData_cut.csv | head -1 >SubsetPredPreyData.csv # Create the subsetdata file with just the header
cat PredPreyData_cut.csv | tail -10 >> SubsetPredPreyData.csv  # Combine the last 10 lines of output into the new Subset file
rm PredPreyData_cut.csv  #remove the temporarily file, make the folder clean


