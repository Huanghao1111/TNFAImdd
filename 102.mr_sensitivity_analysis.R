# Sensitivity analysis using a more stringent LD threshold (r2 < 0.001)
mr_common("ukb-d-30710_irnt.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv",
          local_clump = TRUE, r2 = 0.001, kb = 100, gene = "TNF",
          eaf_threshold = 0.01, gene_win = 100, method_list = c("mr_wald_ratio"))

mr_common("ukb-d-30000_irnt.csv", "MDD2025_PGC_no23andMe_noUKBB_eur.csv",
          local_clump = TRUE, r2 = 0.001, kb = 100, gene = "TNF",
          eaf_threshold = 0.01, gene_win = 100)

mr_common("TNFI_r20.001", "MDD2025_PGC_no23andMe_noUKBB_eur.csv", no_clump = TRUE)
