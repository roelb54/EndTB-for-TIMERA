rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "4FEB/XMLinput_count_epi_baseline_NAM_G.xml",
                  # xml         = "complex-ZAF-test-NAM.xml",
                  # xml         = "XMLinput_econ_M72_CI_POD_55_10yr_2030_adoadu.xml",
                  #xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS.xml",
                  parameters  = "4FEB/input_L0_red.csv",
                  #targets     = "FAST/target_L0_LTBI_all2.csv",
                  targets     = "4FEB/target_L0_LTBI_all_fast_NAM_OK_H.csv",
                  lglevel     = "DEBUG")


i=5
df = read.csv(file="./countries-examples/ZAF/parameters/Area1/ZAF_input_seeds_area1.csv")
for (i in 1:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\n")
  z = run(paths, new.parameter.values = p, write.to.file = T)
  cat(paste0(sum(z$hits$fit,na.rm = T), " hits ", sum(!z$hits$fit,na.rm = T), " misses ...\n"))
}

# compare with ZAF

paths = set.paths(countries   = "countries-examples", 
                  countrycode = "ZAF", 
                  xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS_5yrag.xml",
                  #parameters  = "FAST/input_L0_red.csv",
                  targets     = "FAST/target_L0_LTBI_all2.csv",
                  lglevel     = "DEBUG")

x=run(paths,write.to.file = T)

# try ZAF on NAM 

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS_5yrag_NAM.xml",
                  #parameters  = "FAST/input_L0_red.csv",
                  targets     = "FAST/target_L0_LTBI_all2.csv",
                  lglevel     = "DEBUG")

x=run(paths,write.to.file = T)
# works fine with ZAF targets and NAM demography, deaths, contact rates
# now with NAM targets
paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS_5yrag_NAM.xml",
                  #parameters  = "FAST/input_L0_red.csv",
                  targets     = "4FEB/target_L0_LTBI_all_fast_NAM_OK_K.csv",
                  lglevel     = "DEBUG")

x=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS_5yrag_NAM.xml",
                  parameters  = "FAST/input_L0_red.csv",
                  targets     = "4FEB/target_L0_LTBI_all_fast_NAM_OK_K.csv",
                  lglevel     = "DEBUG")
model = globalenv()
model$paths=paths

run.optimizer(model, lmcontrolcsv = "./levmarq.csv")

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "FAST/XMLinput_target_age_L0_aim_ABC_med_fast_minDs10d_38HITS_5yrag_NAM.xml",
                  parameters  = "FAST/input_L0_red.csv",
                  targets     = "4FEB/target_L0_LTBI_all_fast_NAM_OK_L.csv",
                  lglevel     = "DEBUG")

model$paths=paths

paths = set.paths(countries   = "countries", 
                  countrycode = "NAM", 
                  xml         = "6FEB/XML_NAM_HIVinciNAMsh_46hits_HIVinci_OK_tweakedx2.xml",
                  #parameters  = "5FEB/params_38_of_57_add_midx_fix_some_sh_midhiv.csv",
                  parameters  = "6FEB/params_NAM_HIVinciNAMsh_46hits.csv",
                  targets     = "6FEB/targets46hits57.csv",
                  lglevel     = "DEBUG")
model = globalenv()
model$paths=paths
# model$paths$parameters
# run.optimizer(model, lmcontrolcsv = "./levmarq.csv")

newparams = read.csv("countries/NAM/parameters/6FEB/params_NAM_HIVinciNAMsh_46hits.csv")
sel = newparams$choose==T
selparams = newparams[sel,]
new.parameters = selparams$mean
names(new.parameters)=selparams$unique.name

run.optimizer(model, new.parameter.values = new.parameters, lmcontrolcsv = "./levmarq.csv", pwr=-3)
