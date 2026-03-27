# TNF-mediated CRP
# total Sample size of exposure = 343524
# total sample size cases of outcome = 78868~357636; total sample size controls of outcome = 461528~1281936; total Sample size of outcome = 541378~1639572; population prevalence of outcome = 12.1%~30.6%
mr_common("ukb-d-30710_irnt.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", p1=5e-8, p2=0,
          local_clump = TRUE, r2 = 0.3, kb = 100, gene = "TNF", steiger = T,
          eaf_threshold = 0.01, gene_win = 100)

# TNF_CRP.csv contains the extracted SNPs.
# To represent a decrease in TNF-mediated CRP, the beta values were multiplied by −1.
mr_common("TNF_CRP.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", no_clump = TRUE)

# TNF-mediated WBC
# total Sample size of exposure = 350470
# total sample size cases of outcome = 78868~357636; total sample size controls of outcome = 461528~1281936; total Sample size of outcome = 541378~1639572; population prevalence of outcome = 12.1%~30.6%
mr_common("ukb-d-30000_irnt.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", p1=5e-8, p2=0,
          local_clump = TRUE, r2 = 0.3, kb = 100, gene = "TNF",steiger = T,
          eaf_threshold = 0.01, gene_win = 100)

# TNF_WBC.csv contains the extracted SNPs.
# To indicate the direction of TNF-mediated WBC, the beta values were multiplied by −1.
mr_common("TNF_WBC.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", steiger = T, no_clump = TRUE)

# Merge the two extracted SNP files.
# For duplicated SNPs, the SNP with the larger F-statistic was retained.
mr_common("TNFI", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", steiger = T, no_clump = TRUE)
