#' Copy and paste solution for putting common Latex code in script
#'
#' @author Daniel Hintz
#' @return a character vector
#' @export

tex <- function(){
  cat(paste0("\\renewcommand{\\arraystretch}{1.3} <!-- adding space between cells in tables-->", "\n",
             "\\setlength\\parindent{24pt} <!-- indent paragraphs-->", "\n", "\\doublespacing <!-- double space paragraphs-->", "\n"
  ))
  message("Note: Copy and paste above to start of document")
}
