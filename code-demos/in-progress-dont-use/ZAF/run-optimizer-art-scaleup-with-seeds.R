rm(list=ls())
# model = new.env()
model = globalenv()
source(here::here("R","include-v11.R"),model)
source(here::here("R","/TBVx-optimization-fncs-v2.R"),T)
taskenvvar="taskID"

model$paths = model$set.paths(countries   = "countries-examples", 
                              countrycode = "ZAF", 
                              xml         = "test/XMLinput_epi_art_scaleup5.xml", 
                              parameters  = "test/input_art_scaleup.csv",
                              targets     = "test/target_art_scaleup.csv")


df = read.csv(file="./countries-examples/ZAF/parameters/test/ZAF_paramsets.csv")
for (i in 1:nrow(df)){
 p = as.numeric(df[i,3:ncol(df)])
 names(p)=names(df[3:ncol(df)])
 cat("i=",i,"\n")
 run.optimizer(model, new.parameter.values = p,  constant.new.parameter.values=F, lmcontrolcsv = "./levmarq.csv")
}

