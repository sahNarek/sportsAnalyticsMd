# This function checks if the library is already installed and if so
# it just calls the library.

packages_list <- c("devtools", "dplyr", "ggplot2", "reshape2", "zoo", 
                   "VGAM", "BradleyTerry2", "caret", "measures", "odds.converter", 
                   "glmnet", "Matrix", "intergraph", "igraph",
                   "network", "circlize", "statnet", "sna", "statnetWeb", "kableExtra",
                   "kable", "knitr")


install_or_call <- function(list = packages_list){
  installed <- installed.packages()[,"Package"]
  for( package in packages_list ){
    if(!(package %in% installed)){
      install.packages(package)
    }
    do.call(library, list(package))
  }
}

library(devtools)
install_github("HABET/CSE270")
install_github("DougLuke/UserNetR")


install_or_call()

