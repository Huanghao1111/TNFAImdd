# tnfi_grs as a continuous variable
multi_model <- coxph(Surv(data$follow_up_MDD_ICD_time, data$MDD_ICD_events) ~
                       data$tnfi_grs + Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10
                     , data = data)
multiCox_Sum <- summary(multi_model)
multiCox_Sum
multiCox_CKDSum <- summary(multi_model)
multiCox_Sum$coefficients
multiCox_Sum <- summary(multi_model)
multiCox_CKDSum <- summary(multi_model)
HR <- 1 / round(multiCox_Sum$coefficients[, 2], 3)
pvalue <- round(multiCox_Sum$coefficients[, 5], 3)
CIlow = 1 / round(multiCox_Sum$conf.int[, 3], 3)
CIup = 1 / round(multiCox_Sum$conf.int[, 4], 3)
result_muiti_model <- data.frame('HR' = HR,
                                 'CI low' = CIlow,
                                 'CI up' = CIup, 
                                 'P Value' = pvalue)
colnames(result_muiti_model) <- c("HR", "CI low", "CI up", "P Value")
result_muiti_model

# tnfi_grs as a categorical variable (based on median)
multi_model <- coxph(Surv(data$follow_up_MDD_ICD_time, data$MDD_ICD_events) ~
                       data$tnfi_grs_group + Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10
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
