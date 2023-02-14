#' spell_LV_inc
#' 
#' The \code{spell_LV_inc()} function is used to inspect "INCONCLUSIVE" strings for spell checker performance with two thresholds.
#'
#' The \code{spell_LV_inc()} function uses Levenshtein distance to calculate the string distance with two different thresholds by which if the threshold is beyond that threshold the string is replaced with "INCONCLUSIVE". This function helps inspect what is deemed "INCONCLUSIVE" and if it can be manually corrected or if a lower threshold classifies all strings correctly.
#' 
#' @param dat a character vector with misspellings to be corrected
#' @param corr 	a character vector with correct spellings for reference
#' @param t_low a number to set level for the more sensitive thresholds
#' @param t_high a number to set level for the less sensitive thresholds
#' @param ... ellipse for end user flexibility 
#' @seealso See documentation for \code{?spell_LV} for underlying mechanics
#' 
#' @author Daniel Hintz
#' @return a character vector
#' @export
#'
#' @examples
#' dat <- c(NA, "", "Torrinton", "Laraie","Whatld","Rwlins", "(D)", "eryfeb")
#' corr <- c("Wheatland", "Torrington", "Rawlins", "Laramie")
#' # indentify appropriate sensitivity  
#' spell_LV_inc(dat, corr,3, 8)
#' spell_LV_inc(dat, corr,3, 4)
#' dat <- spell_LV(dat, corr,4)
#'
#' # replace INCONCLUSIVE results for NA's
#' INC <- grep("INCONCLUSIVE", dat)
#' dat[INC] <- NA
#' dat

spell_LV_inc <- function(dat, corr,t_low = 3, t_high = 4, ...){
  A <- data.frame(dat,
                  spell_LV(dat, corr,threshold = t_low),
                  spell_LV(dat, corr,threshold = t_high)
  ) 
  colnames(A) <- c(
    "original",
    paste0("more_sensative","(", t_low, ")"),
    paste0("less_sensative","(", t_high, ")")
  )
  A$row_id <- 1:length(dat)
  A <- A[,c(4,1, 2,3)]
  B <- A[,c(names(A)[3])]
  A <- subset(A, grepl("INCONCLUSIVE",B))
  A
}

