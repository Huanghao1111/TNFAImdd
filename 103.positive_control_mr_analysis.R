# Inflammatory bowel disease
mr_common("TNFI", "CD.csv",  no_clump = TRUE, steiger = FALSE, p2 = 0) # Crohn's disease (ieu-a-12)
mr_common("TNFI", "IBD.csv", no_clump = TRUE, steiger = FALSE, p2 = 0) # Inflammatory bowel disease (ieu-a-294)
mr_common("TNFI", "UC.csv",  no_clump = TRUE, steiger = FALSE, p2 = 0) # Ulcerative colitis (ieu-a-32)

# Inflammatory skin conditions
mr_common("TNFI", "Psoriasis.csv", no_clump = TRUE, steiger = FALSE, p2 = 0) # Psoriasis (GCST90436606)
mr_common("TNFI", "HS.csv", no_clump = TRUE, steiger = FALSE, p2 = 0) # Hidradenitis suppurativa (finn-b-L12_HIDRADENITISSUP)

# Inflammatory arthritis
mr_common("TNFI", "AS.csv", no_clump = TRUE, steiger = FALSE, p2 = 0,method_list = c("mr_wald_ratio")) # Ankylosing spondylitis (ebi-a-GCST005529)
mr_common("TNFI", "RA.csv", no_clump = TRUE, steiger = FALSE, p2 = 0) # Rheumatoid arthritis (GCST002318)
mr_common("TNFI", "PsA.csv", no_clump = TRUE, steiger = FALSE, p2 = 0) # Psoriatic arthritis (GCST007043)

# Eye inflammation
mr_common("TNFI", "Uveitis.csv", no_clump = TRUE, steiger = FALSE, p2 = 0) # Uveitis (GCST90477735)

# Note:
# Because a large number of SNPs in the positive control datasets are strongly correlated,
# the P2 threshold of 5e-5 was not applied, and the Steiger filtering was disabled.
