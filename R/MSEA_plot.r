#' Title
#'
#' @param plotdata table of methylation enrichment result(table after MSEA enrichment)
#'
#' @return bubble plot of methylation enrichment analysis results
#' @export
#'
#' @examples
#' library(DrMyth)
#' data(gene)
#' data(marker)
#' p <- MSEA(gene,marker)
#' MSEA_plot(p)
MSEA_plot <- function(plotdata) {
  pp <- ggplot2::ggplot(plotdata,ggplot2::aes(y=reorder(CancerType,-pvalue),x=p.adj))+ggplot2::geom_point(ggplot2::aes(size=counts,color=p.adj))
  pp <- pp+ggplot2::scale_color_gradient(low="red",high = "blue")
  pp <- pp+ggplot2::labs(x="p.adj",y="CancerType")+ggplot2::theme_bw()
  pp
  return(pp)
}
