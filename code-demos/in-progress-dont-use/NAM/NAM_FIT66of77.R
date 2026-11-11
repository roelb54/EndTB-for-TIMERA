rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "NAM66of71_EndTB.xml",
                  targets     = "NAM_71_targets_EndTB.csv",
                  lglevel     = "DEBUG")

output = run(paths, write.to.file=T)

