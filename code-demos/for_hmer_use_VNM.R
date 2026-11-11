rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)

# 10 APR 2026 12h56
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/try_hmer/VNM_optim.xml",
                  parameters  = "/try_hmer/VNM_optim_params.csv",
                  targets     = "/try_hmer/VNM_targets_MOD_vA_ORIGINAL_and_OK.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
sum(output$hits$fit)
df = read.csv(file="./countries/VNM/parameters/try_hmer/VNM_optim_params.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name

run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")

