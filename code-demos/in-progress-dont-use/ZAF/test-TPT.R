rm(list=ls())
# require(tbvax)
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"
paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "XMLinput_2910_m_TPT_noHIV_after_LTBI_test.xml")
output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "XMLinput_2910_m_TPT_noHIV_after_LTBI_test-experiment-TPT-neg-mult.xml")
output=run(paths,write.to.file = T)




