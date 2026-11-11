rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "Area1/XMLinput_2910_m.xml",
                  parameters  = "Area1/input_0309.csv",
                  targets     = "Area1/target_wprop_adjrelapse_ds.csv",
                  lglevel     = "DEBUG")

df = read.csv(file="./countries/ZAF/parameters/Area1/ZAF_input_seeds_area1.csv")

for (i in 1:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\t")
  b=run(paths, new.parameter.values = p, write.to.file = F)
  cat(sum(b$hits$fit)," hits\n")
}






