# Load data
biodeg <- read.csv("data/biodeg.csv", sep = ";", header = FALSE)



# Data overview
str(biodeg)
dim(biodeg)
summary(biodeg)



# Rename the variables
colnames(biodeg) <- c(
  "SpMax_L",
  "J_Dz_e",
  "nHM",
  "F01_NN",
  "F04_CN",
  "NssssC",
  "nCb_minus",
  "C_percent",
  "nCp",
  "nO",
  "F03_CN",
  "SdssC",
  "HyWi_B_m",
  "LOC",
  "SM6_L",
  "F03_CO",
  "Me",
  "Mi",
  "nN_N",
  "nArNO2",
  "nCRX3",
  "SpPosA_B_p",
  "nCIR",
  "B01_CBr",
  "B03_CCl",
  "N_073",
  "SpMax_A",
  "Psi_i_1d",
  "B04_CBr",
  "SdO",
  "TI2_L",
  "nCrt",
  "C_026",
  "F02_CN",
  "nHDon",
  "SpMax_B_m",
  "Psi_i_A",
  "nN",
  "SM6_B_m",
  "nArCOOR",
  "nX",
  "Biodegradable"
)
names(biodeg)



# Inspect 
biodeg$Biodegradable <- factor(biodeg$Biodegradable)

str(biodeg$Biodegradable)
table(biodeg$Biodegradable)
# NRB  RB 
# 699 356 
prop.table(table(biodeg$Biodegradable))
# NRB = 66.3%
# RB = 33.7%

# The dataset contains 1,055 chemicals, of which 699 (66.3%) are classified as not ready biodegradable
# and 356 (33.7%) are classified as ready biodegradable. This reveals that the classes are somewhat
# imbalanced and accuracy alone may be misleading. Therefore, we need other metrics besides only accuracy
# to evaluate different models.



# Check for missing values
sum(is.na(biodeg))



# Class distribution plot
library(ggplot2)

ggplot(biodeg,
       aes(x = Biodegradable)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribution of Biodegradability Classes",
    x = "Class",
    y = "Count"
  )



