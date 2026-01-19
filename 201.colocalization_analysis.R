mr_coloc_gwas2gwas("ukb-d-30710_irnt.csv",
                   "MDD2025_PGC_no23andMe_noUKBB_eur.csv",
                   gene = "TNF",
                   gene_win = 1000,
                   build_version = "hg19",
                   gwas_type1 = "quant",
                   gwas1_s = 343524,
                   gwas_type2 = "cc",
                   gwas2_s = 357636 / 1639572)

mr_coloc_gwas2gwas("ukb-d-30000_irnt.csv",
                   "MDD2025_PGC_no23andMe_noUKBB_eur.csv",
                   gene = "TNF",
                   gene_win = 1000,
                   build_version = "hg19",
                   gwas_type1 = "quant",
                   gwas1_s = 350470,
                   gwas_type2 = "cc",
                   gwas2_s = 357636 / 1639572)
