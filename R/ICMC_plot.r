#' Title
#'
#' @param gene methylation marker for cancer(The marker gene in the results after ICMC analysis)
#' @param cancer type of cancer(There are 17 cancer types to choose from : "BLCA","BRCA","CESC","COAD","ESCA","GBM","HNSC","KICH","LAML","LIHC","LUSC","PAAD","PRAD","SKCM","STAD","THCA","UCEC")
#'
#' @return Marker methylation levels correlate with immune cell infiltration
#' @export
#'
#' @examples
#' library(DrMyth)
#' ICMC("UCEC")
#' ICMC_plot("MLH1","UCEC")
#' ICMC_plot(c("MLH1","WT1"),"UCEC")
ICMC_plot <- function(gene,cancer) {
  result <- read.csv(system.file("extdata",paste0(cancer,"_immuneCor.result.csv"),package = "DrMyth"),sep = ",")
  gene_cell <- result
  gene_cell$Gene_Cell <- paste0(gene_cell$Gene,gene_cell$Cell)
  gene_cell$Gene_Cell <- gsub(" ","_",gene_cell$Gene_Cell)
  for (j in 1:length(gene)) {
    path1 <- paste0(gene_cell$Gene_Cell[which(gene[j] == gene_cell$Gene)],".png")
    path2 <- paste0("http://8.142.154.29/SCAR2023/DrMyth/",cancer)
    url <- paste(path2,path1,sep = "/")
    for (i in 1:length(url)) {
      utils::download.file(url[i],paste(getwd(),"/",gene[j],"_",i,".png",sep = ""),mode = "wb")
    }
  }
  return("The pictures have been saved to the current working directory!")
}
