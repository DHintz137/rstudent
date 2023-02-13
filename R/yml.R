#' Paste yml header template 
#'
#' @return a character vector
#' @export

yml <- function(){
cat(
"---
title: \"Title\"
subtitle: \"subtitle\"
author: \"Name\"
date: \"`r format(Sys.time(), '%d %B, %Y')`\"
linkcolor: black
citecolor: blue
output:
  bookdown::pdf_document2:
    fig_caption: yes
    highlight: arrow
    latex_engine:  pdflatex
    keep_tex: yes
    toc: no
    citation_package: natbib
    includes:
      in_header: preamble.tex
    number_sections: false
bibliography: references.bib
lof: no
lot: no
editor_options: 
  chunk_output_type: console
---
")
message("Note: Copy and paste above to replace current yml header. Be sure \n to run .Rmd in file or Project with preamble.tex and references.bib, \n if unsure use tex_docs to download templates.")
}