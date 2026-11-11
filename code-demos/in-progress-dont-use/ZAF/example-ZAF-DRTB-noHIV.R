rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "Area1/XMLinput_2910_m_DSDR_noHIV.xml",
                  lglevel     = "DEBUG")

b=run(paths, write.to.file = T)




