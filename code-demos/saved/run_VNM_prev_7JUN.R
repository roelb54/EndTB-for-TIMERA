rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"

#require(endTB)
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
<<<<<<< HEAD
                  #xml         = "VNM_2025-04-22_11h42m39s_optim.xml",
                  xml         = "VNM_XMLinput_C_SES_for_gender_v2_W_prog_tr_sex_age_B.xml",
                  #xml         = "VNM_XMLinput_C_SES_for_gender_v5.xml",
                  parameters  = "VNM_params_W_prog_tr_sex_age.csv",
                  targets     = "VNM_targets_25MAR25_ALL_CORRECT_inclTprev.csv",
                  #targets     = "VNM_targets_25MAR25_ALL_CORRECT.csv",
=======
                  xml         = "VNM_XMLinput_C_SES_for_gender_v2_Q_25MAY2025.xml",
                  #xml         = "VNM_XMLinput_C_SES_for_gender_v5.xml",
                  parameters  = "VNM_params_Q.csv",
                  targets     = "VNM_targets_25MAR25_ALL_CORRECT.csv",
>>>>>>> c3fb30442ce0bdcf13a8a1cc10fa814b96df099a
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

# df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2.csv")
# df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_N.csv")
# df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_V.csv")
df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_W_prog_tr_sex_age.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv", pwr = 2)


# include targets and parameters replacement file and use sampled parameter values
# note that the currently used parameters do not fit the targets very well
df = read.csv(file="./countries/ZAF/paramsets.csv")
for (i in 1:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\n")
  z=run(paths, new.parameter.values = p)
  print(paste0(sum(z$hits$fit)," hits out of ",length(z$hits$fit)," targets"))
}