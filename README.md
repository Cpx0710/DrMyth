# DrMyth
<!-- badges: start -->
<!-- badges: end -->

DrMyth is an R package designed for methylation analysis. This software allows users to input a list of methylated genes, enabling the prediction of cancer types in which this gene set may be enriched after methylation. Additionally, users can explore the correlation between methylation markers and levels of immune cell infiltration in specified cancer types.

## Installation

You can install the released version of DrMyth from [github](https://github.com/Cpx0710/DrMyth) with:

``` r
install.packages("devtools")
devtools::install_github("Cpx0710/DrMyth")
```

## Example

``` r
library(DrMyth)
gene <- data(gene)
marker <- data(marker)
result <- MSEA(gene,marker)
result_plot <- MSEA_plot(result)
imm_result <- ICMC("UCEC")
imm_result_plot <- ICMC_plot(c("MLH1","WT1"),"UCEC")

```
