#' Automated Print Formatting for matrices
#'
#' @param x A matrix 
#' @param ... ellispe not set
#'
#' @author Daniel Hintz
#' @import magrittr
#' @import kableExtra knitr
#' @import finalfit
#' @importFrom utils capture.output
#' @importFrom tibble as_tibble
#' @return A matrix 
#' @export

print_vec <- function(x, ...) {
  if(length(as.vector(as.matrix(x))) < 3){
    round_tidy(x, getOption("digits")) %>% capture.output() %>% cat()
  } else{
    # small dimensions (cond.1)
    # ncol                            #nrow
    if(dim(as.matrix(x))[2] ==1 & dim(as.matrix(x))[1] <= 38){
      knitr::kable(
        x, align = "c",
        digits = getOption("digits"),
        format="latex",
        booktabs = T,
        caption = ""
      ) %>% # styling
        kable_styling(latex_options = c("HOLD_position"),
                      font_size = 9.5,full_width = F) %>% 
        asis_output()
    } else{
      #dimensions to large (cond.2)
      if(dim(as.matrix(x))[2] >= 10 | dim(as.matrix(x))[1] > 38){
        x %>% as_tibble() %>%  capture.output() %>% cat(sep = "\n")
        cat("WARNING: output out off bounds, defualting to tibble. See print.mat")
      } else{
        #dimensions fit asis (cond.3)
        knitr::kable(
          x, align = "c",
          digits = getOption("digits"),
          format="latex",
          booktabs = T,
          caption = ""
        ) %>% # styling
          kable_styling(latex_options = c("HOLD_position"),
                        font_size = 9.5,full_width = F) %>% 
          asis_output()
      }}}
}
