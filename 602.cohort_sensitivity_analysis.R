# According to the previous inclusion and exclusion criteria and variables, without excluding MDD_ICD_baseline, it is data4
# Sensitivity Analysis 1: MDD (events and baseline based on ICD-10)
data4$MDD_ICD <- as.factor(ifelse(data4$MDD_ICD_events == 1 | data4$MDD_ICD_baseline == 1, 1, 0))
logistic_model <- glm(data4$MDD_ICD ~ 
                        data4$tnf_grs_group + Age + Sex + assessment_centre + Genotype_batch1 + 
                        pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                      family = binomial(link = "logit"),
                      data = data4)
logistic_summary <- summary(logistic_model)
logistic_coefficients <- logistic_summary$coefficients
OR <- round(exp(logistic_coefficients[, 1]), 3)  # Calculate OR
pvalue <- round(logistic_coefficients[, 4], 3)   # Extract p-value
CIlow <- round(exp(logistic_coefficients[, 1] - 1.96 * logistic_coefficients[, 2]), 3)  # 95% CI lower bound
CIup <- round(exp(logistic_coefficients[, 1] + 1.96 * logistic_coefficients[, 2]), 3)    # 95% CI upper bound
result_logistic_model <- data.frame('HR' = OR,
                                    'CI low' = CIlow,
                                    'CI up' = CIup, 
                                    'P Value' = pvalue)
colnames(result_logistic_model) <- c("OR", "CI low", "CI up", "P Value")
result_logistic_model

# Sensitivity Analysis 2: MDD (events and baseline based on ICD-10 and Mental Health Questionnaire)
data4.1 <- subset(data4, data4$MDD_MHQ != "NA")
data4.1$MDD_ICD_MHQ <- as.factor(ifelse(data4.1$MDD_ICD_events == 1 | data4.1$MDD_ICD_baseline == 1 | data4.1$MDD_MHQ == 1, 1, 0))
logistic_model <- glm(data4.1$MDD_ICD_MHQ ~ 
                        data4.1$tnf_grs_group + Age + Sex + assessment_centre + Genotype_batch1 + 
                        pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                      family = binomial(link = "logit"),
                      data = data4.1)
logistic_summary <- summary(logistic_model)
logistic_coefficients <- logistic_summary$coefficients
OR <- round(exp(logistic_coefficients[, 1]), 3)  # Calculate OR
pvalue <- round(logistic_coefficients[, 4], 3)   # Extract p-value
CIlow <- round(exp(logistic_coefficients[, 1] - 1.96 * logistic_coefficients[, 2]), 3)  # 95% CI lower bound
CIup <- round(exp(logistic_coefficients[, 1] + 1.96 * logistic_coefficients[, 2]), 3)    # 95% CI upper bound
result_logistic_model <- data.frame('HR' = OR,
                                    'CI low' = CIlow,
                                    'CI up' = CIup, 
                                    'P Value' = pvalue)
colnames(result_logistic_model) <- c("OR", "CI low", "CI up", "P Value")
result_logistic_model

# Sensitivity Analysis 3: MDD (baseline based on primary care data, ICD-10, and UKB Filed ID)
# Corresponding cleaning methods can be found in the Supplement Table 7 of the original article doi.org/10.1016/j.biopsych.2022.08.026

data4$MDD_V2V3_ICD_UKB <- as.factor(ifelse(data4.1$MDD_ICD_baseline == 1| data4.1$MDD_V2V3 == 1 | data4$MDD_UKB == 1, 1, 0))
logistic_model <- glm(data4.1$MDD_V2V3_ICD_UKB ~ 
                        data4.1$tnf_grs_group + Age + Sex + assessment_centre + Genotype_batch1 + 
                        pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, 
                      family = binomial(link = "logit"),
                      data = data4.1)
logistic_summary <- summary(logistic_model)
logistic_coefficients <- logistic_summary$coefficients
OR <- round(exp(logistic_coefficients[, 1]), 3)  # Calculate OR
pvalue <- round(logistic_coefficients[, 4], 3)   # Extract p-value
CIlow <- round(exp(logistic_coefficients[, 1] - 1.96 * logistic_coefficients[, 2]), 3)  # 95% CI lower bound
CIup <- round(exp(logistic_coefficients[, 1] + 1.96 * logistic_coefficients[, 2]), 3)    # 95% CI upper bound
result_logistic_model <- data.frame('HR' = OR,
                                    'CI low' = CIlow,
                                    'CI up' = CIup, 
                                    'P Value' = pvalue)
colnames(result_logistic_model) <- c("OR", "CI low", "CI up", "P Value")
result_logistic_model

# Sensitivity Analysis 4: Further adjusting BMI, Townsend Deprivation Index and CAD
multi_model <- coxph(Surv(data$follow_up_MDD_ICD_time, data$MDD_ICD_events) ~
                       data$tnf_grs_group + Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10 + 
                       data$BMI + data$Townsend1 + data$baseline_CAD_overall_diagnose,
                       data = data)
multiCox_Sum <- summary(multi_model)
multiCox_Sum
multiCox_CKDSum <- summary(multi_model)
multiCox_Sum$coefficients
multiCox_Sum <- summary(multi_model)
multiCox_CKDSum <- summary(multi_model)
HR <- round(multiCox_Sum$coefficients[, 2], 3)
pvalue
