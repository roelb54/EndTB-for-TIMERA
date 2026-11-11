rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS_5yrag_NAM_RISK_tr_V_count.xml",
                  lglevel     = "DEBUG")
paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "XMLinput_econ_M72_CI_POD_55_10yr_2030_adoadu_5yrag_TESTroll.xml",
                  lglevel     = "DEBUG")
x=run(paths,write.to.file = T)





