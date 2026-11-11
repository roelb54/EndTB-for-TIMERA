rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "Area1/XMLinput_2910_m_TPT_noHIV_hhsize_noSES.xml",
                  lglevel     = "DEBUG")

b=run(paths, write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "Area1/XMLinput_2910_m_TPT_noHIV_hhsize.xml",
                  lglevel     = "DEBUG")

b=run(paths, write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "Area1/XMLinput_2910_m_TPT_HIV_hhsize_noSES_duetoHIV.xml",
                  lglevel     = "DEBUG")

b=run(paths, write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "XMLinput_2910_m_TPT_noHIV_after_LTBI_test.xml",
                  lglevel     = "DEBUG")

b=run(paths, write.to.file = T)




