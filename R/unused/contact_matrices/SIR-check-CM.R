rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"
paths = set.paths(countries   = "countries", countrycode = "NLD", xml = "SIR-check-CM.xml")


output=run(paths,write.to.file = T)

