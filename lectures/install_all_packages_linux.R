# This function checks if the library is already installed and if so
# it just calls the library.

packages_list <- c("rlang","devtools", "rmarkdown","dplyr", "ggplot2", "reshape2", "zoo",
                   "VGAM", "caret", "measures", "odds.converter", 
                   "glmnet", "Matrix", "intergraph", "igraph",
                   "network", "circlize", "statnet", "sna", "statnetWeb", 
                   "kable", "knitr")

install.packages("glue")

install_or_call <- function(list = packages_list){
  installed <- installed.packages()[,"Package"]
  for( package in packages_list ){
    if(!(package %in% installed)){
      print(glue::glue("Installing {package}"))
      install.packages(package)
    }
    else{
      print(glue::glue("Calling {package}"))
      do.call(library, list(package)) 
    }
  }
}

install_or_call()

library(devtools)
install_github("HABET/CSE270", force = T)
install_github("DougLuke/UserNetR")

packageurl<-"https://cran.r-project.org/src/contrib/Archive/nloptr/nloptr_1.2.1.tar.gz"
install.packages(packageurl, repos=NULL, type="source")

devtools::install_github("hturner/BradleyTerry2")

# sudo apt install libfontconfig1-dev

devtools::install_github("haozhu233/kableExtra")
tinytex::install_tinytex()

