# TNF-mediated CRP
mr_common("ukb-d-30710_irnt.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv",
          local_clump = TRUE, r2 = 0.3, kb = 100, gene = "TNF",
          eaf_threshold = 0.01, gene_win = 100)

# TNF_CRP.csv contains the extracted SNPs.
# To represent a decrease in TNF-mediated CRP, the beta values were multiplied by −1.
mr_common("TNF_CRP.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", no_clump = TRUE)

# TNF-mediated WBC
mr_common("ukb-d-30000_irnt.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv",
          local_clump = TRUE, r2 = 0.3, kb = 100, gene = "TNF",
          eaf_threshold = 0.01, gene_win = 100)

# TNF_WBC.csv contains the extracted SNPs.
# To indicate the direction of TNF-mediated WBC, the beta values were multiplied by −1.
mr_common("TNF_WBC.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", no_clump = TRUE)

# Merge the two extracted SNP files.
# For duplicated SNPs, the SNP with the larger F-statistic was retained.
mr_common("TNFI", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", no_clump = TRUE)
