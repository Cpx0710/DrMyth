# DrMyth
<!-- badges: start -->
<!-- badges: end -->

The goal of DrMyth is to run the DrMyth flow.

## Installation

You can install the released version of CIBERSORT from [github](https://github.com/Cpx0710/DrMyth) with:

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
