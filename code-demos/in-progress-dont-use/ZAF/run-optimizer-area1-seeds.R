rm(list=ls())
# model = new.env()
model = globalenv()
source(here::here("R","include-v11.R"),model)
source(here::here("R","/TBVx-optimization-fncs-v2.R"),T)
taskenvvar="taskID"

model$paths = model$set.paths(countries   = "countries-examples", 
                              countrycode = "ZAF", 
                              xml         = "Area1/XMLinput_2910_m.xml", 
                              parameters  = "Area1/input_0309.csv",
                              targets     = "Area1/target_wprop_adjrelapse2.csv")


df = read.csv(file="./countries-examples/ZAF/parameters/Area1/ZAF_input_seeds_area1.csv")
for (i in 1:nrow(df)){
 p = as.numeric(df[i,3:ncol(df)])
 names(p)=names(df[3:ncol(df)])
 cat("i=",i,"\n")
 run.optimizer(model, new.parameter.values = p, lmcontrolcsv = "./levmarq.csv")
}

