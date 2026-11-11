rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)
# baseline
paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "XMLinput_ag.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_noTPTall_till_2070.xml",
                  #parameters  = "input_FM.csv",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_no_projection_F_from_2010.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = F) 
sum(baseline$hits$fit)
View(baseline$hits)