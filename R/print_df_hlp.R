#' Helper functon for print_df
#'
#' @param x a dataframe
#' @param ... an ellipse
#'
#' @author Daniel Hintz
#' @return a formated dataframe
#' @export

print_df_hlp  <- function(x,...) {
  # small dimensions (cond.1)
  if(dim(as.matrix(x))[2] ==1 & dim(as.matrix(x))[1] <= 38){
    cat("cond.1: nrow <= 38 AND ncol == 1, see print_df")
  } else{
    # dimensions to large (cond.2)
    if(ncol(x)>= 10 | nrow(x) > 38){
      cat("cond.2: nrow > 38 OR ncol >= 10, see print_df")
    } else{
      # dimensions fit asis (cond.3)
      cat("cond.3: dim none of following:", "\n", 
          "- nrow <= 38 AND ncol == 1", "\n", 
          "- nrow > 38 OR ncol >= 10", "\n",
          "see print_df")
    }
  }}
