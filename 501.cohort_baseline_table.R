data_base <- data[, c(
  "Age", "Sex", "BMI", "Smoking_status", "drinker_status", "SBP_instance_0", "DBP_instance_0", "MET", "Townsend", "highest_education",
  "baseline_CKD_overall_diagnose", "baseline_stroke_overall_diagnose", "baseline_diabetes_overall_diagnose", 'baseline_CAD_overall_diagnose',
  "CRP", "leukocyte", "Antidepressant_drug", "tnfi_grs_group")]
colnames(data_base)[colnames(data_base) %in% colnames(data)]
str(data_base)
vars <- names(data_base)
num_vars <- c("Age", "BMI", "SBP_instance_0", "DBP_instance_0", "MET", "Townsend", "CRP", "leukocyte")
cat_vars <- vars[vars %in% num_vars == FALSE]
data_base <- data_base %>% as.data.frame()
for (i in cat_vars) {
  print(i)
  data_base[, c(i)] <- as.factor(data_base[, c(i)])
}
num_vars[!(num_vars %in% colnames(data_base))]
data_base[, num_vars] <- apply(data_base[, num_vars], MARGIN = 2, FUN = as.numeric)
str(data_base)
non_vars <- c("MET", "Townsend", "CRP", "leukocyte")
data_base <- data_base %>% as.data.frame()
tab0 <- CreateTableOne(data = data_base, strata = "tnfi_grs_group", vars = vars, factorVars = cat_vars, 
                       addOverall = TRUE, smd = TRUE)
tab0 <- print(tab0, contDigits = 2, catDigits = 1, pDigits = 4, quote = FALSE,  
              noSpaces = TRUE, showAllLevels = FALSE, smd = TRUE, nonnormal = non_vars)
write.csv(tab0, file = "baseline_TNF.CSV")
