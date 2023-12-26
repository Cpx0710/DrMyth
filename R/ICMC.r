#' Title
#'
#' @param cancer type of cancer(There are 17 cancer types to choose from : "BLCA","BRCA","CESC","COAD","ESCA","GBM","HNSC","KICH","LAML","LIHC","LUSC","PAAD","PRAD","SKCM","STAD","THCA","UCEC")
#'
#' @return Marker methylation levels correlate with immune cell infiltration
#' @export
#'
#' @examples
#' library(DrMyth)
#' ICMC("UCEC")
ICMC <- function(cancer) {
  result <- read.csv(system.file("extdata",paste0(cancer,"_immuneCor.result.csv"),package = "DrMyth"),sep = ",")
  return(result)
}
