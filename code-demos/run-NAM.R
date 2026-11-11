#checked for endTB 3.6.0
rm(list=ls())
require(endTB)
model = globalenv()
#source(here::here("R","include-v11.R"),model)
#source(here::here("R","TBVx-run-v1.R"),T)
#taskenvvar="taskID"

# include targets
paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "NAM66of71_EndTB.xml",
                  targets     = "NAM_71_targets_EndTB.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit !=T)

