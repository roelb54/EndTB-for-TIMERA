# checked for endTB 3.6.1
rm(list=ls())
#source(here::here("R","include-v11.R"))
#source(here::here("R","TBVx-run-v1.R"))
#taskenvvar="taskID"
require(endTB)

# note that writing to csv takes a long time ... fst is a better format in this case
paths_base = set.paths(countries = "countries", countrycode = "ZAF", xml = "XMLinput_count_epi_baseline_5yrag.xml")
output_base=run(paths_base,write.to.file = F, output.format = "fst")

paths_intv = set.paths(countries = "countries", countrycode = "ZAF", xml = "XMLinput_BCG_AI_POI_45_10yr_med_2025_5yrag.xml")
output_intv=run(paths_intv,write.to.file = T, baseline = output_base, output.format = "fst")


