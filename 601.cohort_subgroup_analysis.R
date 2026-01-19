# Subgroup analysis based on age, sex, baseline inflammation, antidepressant use, and the score of traumatic events
# Sequentially perform analysis on selected subgroups
data_subgroup <- subset(data, data$Age > 60)
data_subgroup <- subset(data, data$Age <= 60)
data_subgroup <- subset(data, data$CRP_group == 1)
data_subgroup <- subset(data, data$CRP_group == 0)
data_subgroup <- subset(data, data$leukocyte_group == 1)
data_subgroup <- subset(data, data$leukocyte_group == 0)
data_subgroup <- subset(data, data$Antidepressant_drug == 1)
data_subgroup <- subset(data, data$Antidepressant_drug == 0)
data_subgroup <- subset(data2, data2$Traumatic_events1 == 1)
data_subgroup <- subset(data2, data2$Traumatic_events1 == 0)

# Multivariate results for subgroups
multi_model <- coxph(Surv(data_subgroup$follow_up_MDD_ICD_time, data_subgroup$MDD_ICD_events) ~
                       data_subgroup$tnf_grs_group + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10
                     , data = data_subgroup)
multiCox_Sum <- summary(multi_model)
multiCox_Sum
multiCox_CKDSum <- summary(multi_model)
multiCox_Sum$coefficients
multiCox_Sum <- summary(multi_model)
multiCox_CKDSum <- summary(multi_model)
HR <- round(multiCox_Sum$coefficients[, 2], 3)
pvalue <- round(multiCox_Sum$coefficients[, 5], 3)
CIlow = round(multiCox_Sum$conf.int[, 3], 3)
CIup = round(multiCox_Sum$conf.int[, 4], 3)
result_muiti_model <- data.frame('HR' = HR,
                                 'CI low' = CIlow,
                                 'CI up' = CIup, 
                                 'P Value' = pvalue)
colnames(result_muiti_model) <- c("HR", "CI low", "CI up", "P Value")
result_muiti_model

# Interaction analysis
# Sequentially perform analysis on different subgroup variables
multi_model <- coxph(Surv(data$follow_up_MDD_ICD_time, data$MDD_ICD_events) ~
                       data$tnfi_grs_group * data$Antidepressant_drug + Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10
                     , data = data)
multiCox_Sum <- summary(multi_model)
multiCox_Sum
multiCox_CKDSum <- summary(multi_model)
multiCox_Sum$coefficients
multiCox_Sum <- summary(multi_model)
multiCox_CKDSum <- summary(multi_model)
HR <- round(multiCox_Sum$coefficients[, 2], 3)
pvalue <- round(multiCox_Sum$coefficients[, 5], 3)
CIlow = round(multiCox_Sum$conf.int[, 3], 3)
CIup = round(multiCox_Sum$conf.int[, 4], 3)
result_muiti_model <- data.frame('HR' = HR,
                                 'CI low' = CIlow,
                                 'CI up' = CIup, 
                                 'P Value' = pvalue)
colnames(result_muiti_model) <- c("HR", "CI low", "CI up", "P Value")
result_muiti_model
