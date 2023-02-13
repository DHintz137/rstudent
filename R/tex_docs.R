#' Download template preamble.tex and .bib files for pdf Rmarkdown
#'
#' @param pream boolean. download preamble.tex
#' @param bib boolean. download references.bib
#'
#' @return
#' @export
#' @importFrom utils download.file
#'
#' @examples

tex_docs <- function(pream = TRUE, bib = TRUE){
  if(pream == TRUE){
    download.file("https://www.dropbox.com/s/bx8bs0iiq2xdsyp/preamble.tex?raw=1", destfile="preamble.tex")
  }
  if(bib == TRUE){
    download.file("https://www.dropbox.com/s/4scmx2s55s0k8vv/references.bib?raw=1", destfile="references.bib")
    message("Note: Example only! Download your own references in .bib from google shcolor")
  }
}