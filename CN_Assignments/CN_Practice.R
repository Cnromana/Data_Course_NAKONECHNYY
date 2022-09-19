list.files(pattern = "data",recursive = TRUE,full.names = TRUE,
          ignore.case = TRUE,include.dirs = TRUE,path = ../)

library(tidyverse)

list.files()

grep()
#looks for patterns