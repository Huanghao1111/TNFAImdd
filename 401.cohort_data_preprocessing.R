# Data preprocessing (assuming you have applied for UKB data access and processed variables are stored on the UKB analysis platform)
data <- data.table::fread("UKbiobank_20260113_HHZ.csv")

# Select European population
data <- subset(data, data$`Ethnic background | Instance 0` == "1001" |
               data$`Ethnic background | Instance 0` == "1002" |
               data$`Ethnic background | Instance 0` == "1003" |
               data$`Ethnic background | Instance 0` == "1004" |
               data$`Ethnic background | Instance 0` == "1")

# Exclude baseline MDD (based on ICD-10 codes F32–F34)
data <- subset(data, data$MDD_ICD_baseline != "1")

# Exclude missing CRP and leukocyte data
data <- subset(data, data$`C-reactive protein | Instance 0` != "NA")
data <- subset(data, data$`White blood cell (leukocyte) count | Instance 0` != "NA")

# Exclude missing genotyping data and address genetic issues (e.g., sex, polyploidy, kinship)
data <- subset(data, data$`Genotype measurement batch` != "NA")
data <- subset(data, data$`Genetic principal components | Array 1` != "NA")
data <- subset(data, data$tnf_grs != "NA")  # TNF GRS calculation method and formula are described in the original manuscript
data$tnf_grs <- data$tnf_grs - median(data$tnf_grs)  # Transform to a distribution centered around 0
data$tnfi_grs <- as.numeric(-data$tnf_grs)
data$tnfi_crp_grs <- as.numeric(-data$tnf_crp_grs)
data$tnfi_wbc_grs <- as.numeric(-data$tnf_wbc_grs)
data$`Genetic sex` <- as.factor(ifelse(data$`Genetic sex` == "Male", 1, 0))
data <- subset(data, data$`Genetic sex` == data$Sex)
data <- subset(data, data$`Genetic kinship to other participants` != "Ten or more third-degree relatives identified")
data <- subset(data, data$`Sex chromosome aneuploidy` != "Yes")

# Proteomics subgroup
data1 <- subset(data, data$`TNF;Tumor necrosis factor` != "NA")
# Mental health questionnaire subgroup (For MDD diagnosis based on the mental health questionnaire, see Supplementary Table 6 in the original article: doi: 10.1192/bjo.2019.100)
data2 <- subset(data, data$MDD_MHQ != "NA")

# Covariate processing
# Smoking status
data$Smoking_status <- ifelse(grepl("-3", data$`Smoking status | Instance 0`), NA, data$`Smoking status | Instance 0`)

# Alcohol consumption status
data$drinker_status <- ifelse(grepl("-3", data$`Alcohol drinker status | Instance 0`), NA, data$`Alcohol drinker status | Instance 0`)

# Physical activity
summary(data$`MET minutes per week for moderate activity | Instance 0`)

# Socioeconomic status
summary(data$`Townsend deprivation index at recruitment`)

# Education
data$highest_education <- ifelse(grepl("1", data$`Qualifications | Instance 0`), 1,
                                 ifelse(data$`Qualifications | Instance 0` == "-3", NA, 0))

# For convenience, redefine variable names based on personal preferences
data$Age <- data$`Age at recruitment`
data$BMI <- data$`Body mass index (BMI) | Instance 0`
data$MET <- data$`MET minutes per week for moderate activity | Instance 0`
data$Townsend <- data$`Townsend deprivation index at recruitment`
data$Genotype_batch <- data$`Genotype measurement batch`
data$pc1 <- data$`Genetic principal components | Array 1`
data$pc2 <- data$`Genetic principal components | Array 2`
data$pc3 <- data$`Genetic principal components | Array 3`
data$pc4 <- data$`Genetic principal components | Array 4`
data$pc5 <- data$`Genetic principal components | Array 5`
data$pc6 <- data$`Genetic principal components | Array 6`
data$pc7 <- data$`Genetic principal components | Array 7`
data$pc8 <- data$`Genetic principal components | Array 8`
data$pc9 <- data$`Genetic principal components | Array 9`
data$pc10 <- data$`Genetic principal components | Array 10`
data$Genotype_batch1 <- ifelse(grepl("^Batch", data$Genotype_batch), 0, 1)
data$assessment_centre <- data$`UK Biobank assessment centre | Instance 0`
data$CRP <- data$`C-reactive protein | Instance 0`
data$leukocyte <- data$`White blood cell (leukocyte) count | Instance 0`
data$TNF <- data$`TNF;Tumor necrosis factor`
median_value2 <- median(data$Townsend, na.rm = TRUE)
data$Townsend1 <- as.factor(ifelse(data$Townsend > (-2.28), 1, 0))

## Group exposures of interest
data$tnfi_grs_group <- as.factor(ifelse(data$tnfi_grs < median(data$tnfi_grs), 0, 1))
data$CRP_group <- as.factor(ifelse(data$CRP > median(data$CRP), 1, 0))
data$leukocyte_group <- as.factor(ifelse(data$leukocyte > median(data$leukocyte), 1, 0))
data1$TNF_group <- as.factor(ifelse(data1$TNF > median(data1$TNF), 1, 0))
data2$Traumatic_events1 <- as.factor(ifelse(data2$Traumatic_events > median(data2$Traumatic_events), 1, 0))  # Refer to the original manuscript for traumatic event scoring processing
