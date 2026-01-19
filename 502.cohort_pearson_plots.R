data_base1 <- as.data.frame(data[, c("tnfi_grs", "CRP", "leukocyte")])
data_base1 <- na.omit(data_base1)
cor_matrix <- cor(data_base1, method = "pearson")
addcol <- colorRampPalette(c("blue", "white", "red"))
testRes = cor.mtest(data_base1, method = "pearson", conf.level = 0.95)
corrplot(cor_matrix, method = "color", col = addcol(100), 
         tl.col = "black", tl.cex = 0.8, tl.srt = 45, tl.pos = "lt",
         p.mat = testRes$p, diag = T, type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 1.2,
         insig = 'label_sig', pch.col = 'grey20')
corrplot(cor_matrix, method = "number", type = "lower", col = addcol(100), 
         tl.col = "n", tl.cex = 0.8, tl.pos = "n",
         add = T)

# Further analysis on the protein subgroup data
data_base2 <- as.data.frame(data1[, c("tnfi_grs", "CRP", "leukocyte", "TNF")])
data_base2 <- na.omit(data_base2)
cor_matrix <- cor(data_base2, method = "pearson")
addcol <- colorRampPalette(c("blue", "white", "red"))
testRes = cor.mtest(data_base2, method = "pearson", conf.level = 0.95)
corrplot(cor_matrix, method = "color", col = addcol(100), 
         tl.col = "black", tl.cex = 0.8, tl.srt = 45, tl.pos = "lt",
         p.mat = testRes$p, diag = T, type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 1.2,
         insig = 'label_sig', pch.col = 'grey20')
corrplot(cor_matrix, method = "number", type = "lower", col = addcol(100), 
         tl.col = "n", tl.cex = 0.8, tl.pos = "n",
         add = T)
