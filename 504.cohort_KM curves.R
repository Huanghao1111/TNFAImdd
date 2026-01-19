# Plotting the KM curve for CRP group and MDD
fit <- survfit(Surv(data$follow_up_MDD_ICD_time, data$MDD_ICD_events) ~
                 data$CRP_group, data = data)
ggsurvplot(fit, data = data, risk.table = F, pval.coord = c(2, 0.05),
           palette = c("#0077b6", "#ff6f61"),
           plot.background = element_rect(fill = "#9dc3e6"),
           pval = T, conf.int = F, xlab = 'Time in year', xscale = 365,
           break.time.by = 365, fun = "cumhaz",
           legend.labs = c("Low level of CRP", "High level of CRP"),
           legend.title = " ", xlim = c(0, 365 * 14), ylim = c(0, 0.10), censor = F)

# Plotting the KM curve for leukocyte group and MDD
fit <- survfit(Surv(data$follow_up_MDD_ICD_time, data$MDD_ICD_events) ~
                 data$leukocyte_group, data = data)
ggsurvplot(fit, data = data, risk.table = F, pval.coord = c(2, 0.05),
           palette = c("#0077b6", "#ff6f61"),
           plot.background = element_rect(fill = "#9dc3e6"),
           pval = T, conf.int = F, xlab = 'Time in year', xscale = 365,
           break.time.by = 365, fun = "cumhaz",
           legend.labs = c("Low level of leukocyte", "High level of leukocyte"),
           legend.title = " ", xlim = c(0, 365 * 14), ylim = c(0, 0.10), censor = F)

# Plotting the KM curve for leukocyte group and MDD in the protein subgroup
fit <- survfit(Surv(data1$follow_up_MDD_ICD_time, data1$MDD_ICD_events) ~
                 data1$TNF_group, data = data1)
ggsurvplot(fit, data = data1, risk.table = F, pval.coord = c(2, 0.05),
           palette = c("#0077b6", "#ff6f61"),
           plot.background = element_rect(fill = "#9dc3e6"),
           pval = T, conf.int = F, xlab = 'Time in year', xscale = 365,
           break.time.by = 365, fun = "cumhaz",
           legend.labs = c("Low level of TNF proteins", "High level of TNF proteins"),
           legend.title = " ", xlim = c(0, 365 * 14), ylim = c(0, 0.10), censor = F)
