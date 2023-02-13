#' Helper function for print_vec
#'
#' @param x a vector
#' @param ... an ellipse 
#'
#' @return NULL
#' @author Daniel Hintz
#' @export

print_vec_hlp <- function(x, ...) {
  # less than 3 values (cond.1)
  if(length(as.vector(as.matrix(x))) < 3){
    cat("cond.1: nobs. < 3, see print_vec")
  } else{
    # small dimensions (cond.2)
    # ncol                            #nrow
    if(dim(as.matrix(x))[2] ==1 & dim(as.matrix(x))[1] <= 38){
      cat("cond.2: nrow <= 38 AND ncol ==1, see print_vec")
    } else{
      #dimensions to large (cond.3)
      if(dim(as.matrix(x))[2] >= 10 | dim(as.matrix(x))[1] > 38){
        cat("cond.3: nrow > 38 OR ncol >= 10, see print_vec")
      } else{
        #dimensions fit asis (cond.4)
        cat("cond.4: dim none of following", "\n", 
            "- nobs. < 3", "\n", 
            "- nrow <= 38 AND ncol ==1", "\n",
            "- nrow > 38 OR ncol >= 10", "\n",
            "see print_vec")
      }}}
}
