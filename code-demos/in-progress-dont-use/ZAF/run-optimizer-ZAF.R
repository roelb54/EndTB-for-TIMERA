rm(list=ls())
model = new.env()
# model = globalenv()
source(here::here("R","include-v11.R"),model)
source(here::here("R","/TBVx-optimization-fncs-v2.R"),T)
taskenvvar="taskID"

model$paths = model$set.paths(countries   = "countries-examples", 
                              countrycode = "ZAF", 
                              xml         = "Area1/XMLinput_2910_m.xml", 
                              parameters  = "Area1/input_0309.csv",
                              targets     = "Area1/target_wprop_adjrelapse2.csv")


run.optimizer(model, lmcontrolcsv = "./levmarq.csv")

