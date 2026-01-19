# This analysis uses the MendelR package described in the following publication.
# Please cite the original article when using this code.
# Ke, X., Li, K., Lin, A., Zhang, Y. and Luo, P. (2025), MendelR: A One-Stop R Toolkit for Mendelian Randomization Analysis.Med Research. https://doi.org/10.1002/mdr2.70046
# For questions related to the code, please contact the corresponding author: Haozhang Huang (email: 1017988724@qq.com)

devtools::install_github("flash0926/mrhelp",force = T)
mrhelp::install_mr()
library(MendelR)
