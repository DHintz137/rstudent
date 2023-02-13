#' Automatically Format Printing 
#'
#' @author Daniel Hintz
#' @return NULL
#' @export

printS3 <- function(){
  registerS3method("knit_print", "data.frame", print_df)
  registerS3method("knit_print", "numeric", print_vec)
}
