#' Automatically Format printing for dataframes 
#'
#' @param x a dataframe
#' @param ... an ellispse
#'
#' @author Daniel Hintz
#' @import kableExtra knitr magrittr
#' @importFrom utils capture.output
#' @importFrom tibble as_tibble
#' @return a dataframe
#' @export

print_df  <- function(x,...) {
  # small dimensions (cond.1)
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
    # dimensions to large (cond.2)
    if(ncol(x)>= 10 | nrow(x) > 38){
      x %>% as_tibble() %>%  capture.output() %>% cat(sep = "\n")
      cat("WARNING: output out off bounds, defualting to tibble. See print.df")
    } else{
      # dimensions fit asis (cond.3)
      knitr::kable(
        x, 
        align = "c",
        digits = getOption("digits"),
        format="latex",
        booktabs = T,
        caption = ""
      ) %>% # styling
        kable_styling(latex_options = c("HOLD_position"),
                      font_size = 9.5,full_width = F) %>% 
        asis_output()
    }
  }}
