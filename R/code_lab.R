#' Add Labels for Code Chunks 
#'
#' @import knitr
#' @return
#' @export

code_lab <- function(){
  oldSource <- knit_hooks$get("source")
  knit_hooks$set(source = function(x, options) {
    x <- oldSource(x, options)
    x <- ifelse(!is.null(options$ref), paste0("\\label{", options$ref,"}", x), x)
    ifelse(!is.null(options$codecap),
           paste0("\\begingroup\\captionof{chunk}{", options$codecap,"}", x, "\\endgroup"), x)
  })
}