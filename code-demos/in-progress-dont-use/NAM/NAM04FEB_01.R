rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"



paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "4FEB/XMLinput_epi_5yr_04FEB_A.xml",
                  # xml         = "complex-ZAF-test-NAM.xml",
                  # xml         = "XMLinput_econ_M72_CI_POD_55_10yr_2030_adoadu.xml",
                  #xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS.xml",
                  #parameters  = "FAST/input_L0_red.csv",
                  #targets     = "FAST/target_L0_LTBI_all2.csv",
                  lglevel     = "DEBUG")

x=run(paths,write.to.file = F)
