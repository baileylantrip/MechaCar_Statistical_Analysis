# Deliverable 1: Linear Regression
# load dplyr package 
library(dplyr)
# Read in csv file 
mechacar_mpg <- read.csv('./resources/mechacar_mpg.csv',stringsAsFactors = F) #read in dataset
head(mechacar_mpg)
# Perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_mpg)
# Determine the p-value and the r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_mpg))

# Deliverable 2: Visualizations for the Trip Analysis
# read in csv file
suspension_coil <- read.csv('./resources/suspension_coil.csv',stringsAsFactors = F) #read in dataset
head(suspension_coil)
# create summary for PSI data
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
# create summary for PSI data by lot 
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI),.groups='keep') 

#Deliverable 3: T-Tests on Suspension Coils
# perform t-test across all manufacturing lots 
t.test(suspension_coil$PSI, mu=1500)
# Lot 1 t-test 
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot1")$PSI, mu=1500)
# Lot 2 t-test
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot2")$PSI, mu=1500)
#Lot 3 t-test
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot3")$PSI, mu=1500)
