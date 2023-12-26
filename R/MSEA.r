#' Main functions
#'
#' The Main function of DrMyth
#' @param datalist list of methylation genes
#' @param marker list of methylation marker genes
#' @return methylation enrichment results
#' @export
#' @importFrom stats p.adjust
#' @examples
#' library(DrMyth)
#' data(gene)
#' data(marker)
#' MSEA(gene,marker)
MSEA <- function(datalist,marker) {
  cancertype <- unique(marker$Cancer.Type)
  marker1 <- marker[which(marker$Cancer.Type==cancertype[1]),]
  N = 20000
  n = length(datalist$V1)
  m = length(marker1$Gene.Symbol)
  k = length(intersect(marker1$Gene.Symbol,datalist$V1))
  p = 1-phyper(k-1,m, N-m, n)
  x <- data.frame(CancerType=cancertype[1],pvalue=p,counts=k)
  for (i in 2:21) {
    marker1 <- marker[which(marker$Cancer.Type==cancertype[i]),]
    N = 20000
    n = length(datalist$V1)
    m = length(marker1$Gene.Symbol)
    k = length(intersect(marker1$Gene.Symbol,datalist$V1))
    p = 1-phyper(k-1,m, N-m, n)
    x <- rbind(x,data.frame(CancerType=cancertype[i],pvalue=p,counts=k))
  }
  x$p.adj =p.adjust(x$pvalue,method = "BH")
  return(x)
}
