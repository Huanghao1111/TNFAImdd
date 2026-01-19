# Drawing RCS plots
data_RCS1 <- data.frame(data[, c("follow_up_MDD_ICD_time", "MDD_ICD_events", "tnfi_grs", "CRP", "leukocyte",
                                  "tnfi_crp_grs", "tnfi_wbc_grs", "Age", "Sex",
                                  "assessment_centre", "Genotype_batch1", "pc1", "pc2", "pc3", "pc4", "pc5",
                                  "pc6", "pc7", "pc8", "pc9", "pc10")])
data_RCS1 <- data_RCS1 %>% na.omit()
dd <- datadist(data_RCS1)
options(datadist = 'dd')

# Plotting the RCS for CRP and MDD
fit <- cph(Surv(data_RCS1$follow_up_MDD_ICD_time, data_RCS1$MDD_ICD_events) ~
           rcs(CRP, 3) + Age + Sex, data = data_RCS1)
HR <- Predict(fit, CRP, fun = exp, ref.zero = TRUE)
ggplot() + geom_line(data = HR, aes(CRP, yhat), linetype = 1, linewidth = 1, alpha = 0.9, colour = "red") +
  geom_ribbon(data = HR, aes(CRP, ymin = lower, ymax = upper), alpha = 0.3, fill = "red") +
  geom_hline(yintercept = 1, linetype = 2, linewidth = 1) + theme_classic() + 
  labs(title = "Incidence of MDD", x = "CRP", y = "HR(95%CI)") +
  theme(
    plot.background = element_rect(color = "black", linewidth = 1)
  )

# Plotting the RCS for leukocyte and MDD
fit <- cph(Surv(data_RCS1$follow_up_MDD_ICD_time, data_RCS1$MDD_ICD_events) ~
           rcs(leukocyte, 3) + Age + Sex, data = data_RCS1)
HR <- Predict(fit, leukocyte, fun = exp, ref.zero = TRUE) 
ggplot() + geom_line(data = HR, aes(leukocyte, yhat), linetype = 1, linewidth = 1, alpha = 0.9, colour = "red") +
  geom_ribbon(data = HR, aes(leukocyte, ymin = lower, ymax = upper), alpha = 0.3, fill = "red") +
  geom_hline(yintercept = 1, linetype = 2, linewidth = 1) + theme_classic() + 
  labs(title = "Incidence of MDD", x = "leukocyte", y = "HR(95%CI)") +
  theme(
    plot.background = element_rect(color = "black", linewidth = 1) 
  )

# Plotting the RCS for TNF-mediated CRP lowing and MDD
fit <- cph(Surv(data_RCS1$follow_up_MDD_ICD_time, data_RCS1$MDD_ICD_events) ~
           rcs(tnfi_crp_grs, 3) + Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, data = mydata5_RCS)
HR <- Predict(fit, tnfi_crp_grs, fun = exp, ref.zero = TRUE) 
ggplot() + geom_line(data = HR, aes(tnfi_crp_grs, yhat), linetype = 1, linewidth = 1, alpha = 0.9, colour = "red") +
  geom_ribbon(data = HR, aes(tnfi_crp_grs, ymin = lower, ymax = upper), alpha = 0.3, fill = "red") +
  geom_hline(yintercept = 1, linetype = 2, linewidth = 1) + theme_classic() + 
  labs(title = "Incidence of MDD", x = "TNF-mediated CRP scores", y = "HR(95%CI)") +
  theme(
    plot.background = element_rect(color = "black", linewidth = 1) 
  )

# Plotting the RCS for TNF-mediated leukocyte lowing and MDD
fit <- cph(Surv(data_RCS1$follow_up_MDD_ICD_time, data_RCS1$MDD_ICD_events) ~
           rcs(tnfi_wbc_grs, 3) + Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, data = mydata5_RCS)
HR <- Predict(fit, tnfi_wbc_grs, fun = exp, ref.zero = TRUE) 
ggplot() + geom_line(data = HR, aes(tnfi_wbc_grs, yhat), linetype = 1, linewidth = 1, alpha = 0.9, colour = "red") +
  geom_ribbon(data = HR, aes(tnfi_wbc_grs, ymin = lower, ymax = upper), alpha = 0.3, fill = "red") +
  geom_hline(yintercept = 1, linetype = 2, linewidth = 1) + theme_classic() + 
  labs(title = "Incidence of MDD", x = "TNF-mediated leukocyte scores", y = "HR(95%CI)") +
  theme(
    plot.background = element_rect(color = "black", linewidth = 1) 
  )

# Further analysis in the protein subgroup and plotting the RCS for TNF and MDD
data_RCS2 <- data.frame(data1[, c("follow_up_MDD_ICD_time", "MDD_ICD_events", "TNF", "Age", "Sex")])
data_RCS2 <- data_RCS2 %>% na.omit()
dd <- datadist(data_RCS2)
options(datadist = 'dd')
fit <- cph(Surv(data_RCS2$follow_up_MDD_ICD_time, data_RCS2$MDD_ICD_events) ~
           rcs(TNF, 3) + Age + Sex, data = data_RCS2)
HR <- Predict(fit, TNF, fun = exp, ref.zero = TRUE) 
ggplot() + geom_line(data = HR, aes(TNF, yhat), linetype = 1, linewidth = 1, alpha = 0.9, colour = "red") +
  geom_ribbon(data = HR, aes(TNF, ymin = lower, ymax = upper), alpha = 0.3, fill = "red") +
  geom_hline(yintercept = 1, linetype = 2, linewidth = 1) + theme_classic() + 
  labs(title = "Incidence of MDD", x = "TNF", y = "HR(95%CI)") +
  theme(
    plot.background = element_rect(color = "black", linewidth = 1) 
  )


# Plotting the RCS + density plot for tnfi_grs
fit <- cph(Surv(follow_up_MDD_ICD_time, MDD_ICD_events) ~ rcs(tnfi_grs, 3) +
             Age + Sex + assessment_centre + Genotype_batch1 + pc1 + pc2 + pc3 + pc4 + pc5 + pc6 + pc7 + pc8 + pc9 + pc10, data = data_RCS1)
## Plot##
col = c('skyblue', 'SteelBlue') ## Blue color##
HR <- rms::Predict(fit, tnfi_grs, fun = exp, type = "predictions", ref.zero = T, conf.int = 0.95, digits = 2)
par(mar = c(5, 4, 4, 5)) # par(mar=c(5,4,4,5),new=T)，mar is used to set the plot boundary blank width, with four values representing the lower, left, upper, and right boundaries,
# The value unit is line width lwd, new=T means a new layer can be added.
plot(density(data_RCS1$tnfi_grs),  ### Density estimation curve
     axes = T,   ## Do not display axes, which is a prerequisite for adding axes below
     xlab = "TNFi genetic score",
     ylab = "",  ## X and Y axis labels
     yaxt = "n", ## Remove the left Y axis
     xlim = c(-1, 1),   ## X-axis scale range
     ylim = c(0, 1.5),   ## Y-axis scale range
     type = 'l',     # Explanation below
     lty = 1, ## Line style 0, 1, 2 means no line, solid line, dashed line respectively;
     lwd = 2, ## Line width default is 1
     col = col[1], # Color
     main = 'curve')  ## Title
## Fill the plot with color
polygon(density(data_RCS1$tnfi_grs), ##### Density estimation curve
        col = col[1], ## Fill color
        border = col[1]) ## Border color
## Add axes
axis(4)  ## Add right Y axis; explanation below
par(new = T) ## Create a new plot, similar to layer stacking in ggplot2
### Overlay the smooth curve
plot(HR[, 1], HR$yhat, axes = T, type = 'l', lty = 1, lwd = 2, col = col[2],
     ylim = c(0.7, 1.2),    ## Custom left Y axis scale (not required to be consistent)
     xlim = c(-1, 1), ## Make sure the scale range is consistent with above
     xlab = 'TNFi genetic score', ylab = 'HR(95%CI)')
## Overlay the 95% confidence interval for the smooth curve
lines(HR[, 1], HR$lower, type = 'l', lty = 2, lwd = 2, col = col[2])
lines(HR[, 1], HR$upper, type = 'l', lty = 2, lwd = 2, col = col[2])
## Add text around the plot
mtext('Density', side = 4, line = 3, outer = F) ## 1, 2, 3, 4 represent bottom, left, top, right, text added to the right in this case
## Add scatter points to the plot
points(x = dd$limits$tnfi_grs[2], ## Scatter point X axis coordinate
       y = 1, #### Scatter point Y axis coordinate
       pch = 19,## pch is the point shape, numbers from 1-25 represent different point shapes.
       col = col[2], 
       cex = 1.5)
anova(fit)
