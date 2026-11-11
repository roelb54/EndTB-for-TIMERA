rm(list=ls())
#library(tbvax)
model = globalenv()
source(here::here("R","include-v11.R"),model)
source(here::here("R","TBVx-run-v1.R"),T)
taskenvvar="taskID"


paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "SIR-minimal.xml")
output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "SEIR-SES.xml")
output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "SEIR-SES-Iinci.xml")
output=run(paths,write.to.file = T)



