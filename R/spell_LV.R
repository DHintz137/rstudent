#' Spell checker with threshold 
#'
#' Spell check correction using Levenshtein distance
#' 
#' As threshold gets smaller than 4 we are being more restrictive (more precise) in what we we allow our algorithm correct, hence If you want to see what values are more borderline set a more restrictive threshold of 3.
#' 
#' @param dat a character vector with misspellings to be corrected. 
#' @param corr a character vector with correct spellings for reference.
#' @param threshold a number to set level of sensitivity. 
#' @param ... ellipse in \code{stringdist(., ...)} allows for user flexibility in calculating string distance for \code{spell_LV()}. 
#'
#' @author Daniel Hintz
#' @importFrom stringdist stringdist
#' @return a character vector
#' @export
#'
#' @examples
#' dat <- c(NA, "Rawln", NA, NA, "", "Torrinton", "Laraie", "Laamie","Torringtn","Whatld","Rwlins")
#' corr <- c("Wheatland", "Torrington", "Rawlins", "Laramie")
#' spell_LV(dat, corr,threshold = 3)

spell_LV <- function(dat, corr,threshold = 4, ...){
if(!is.character(dat)){
  stop("dat is not of class `character`; it has class '", class(dat), "'.")
}
if(!is.character(corr)){                      
  stop("corr is not of class `character`; it has class '", class(corr), "'.")
} 
  # converting "" to NA
  dat[nchar(dat)==0 & !is.na(dat)]<-NA
  
  newDat<-NULL
  for(i in 1:length(dat)){
    
    if(is.na(dat[i])){
      tempNew <- NA
    }else{
      V<- stringdist(dat[i],corr,method='lv', ...)
      if(min(V) >= threshold){
        tempNew <- "INCONCLUSIVE"
      }else{
        tempNew <- corr[which.min(V)]
      }
    }
    newDat<- c(newDat,tempNew)
  }
  return(newDat)
}
 
