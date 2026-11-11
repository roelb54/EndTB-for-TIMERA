rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"

#require(endTB)
# 13 JUNE 2025 12h20
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "13JUN2025/VNM_XMLinput_C_SES_for_gender_v4_D.xml",
                  parameters  = "13JUN2025/VNM_XMLinput_C_SES_for_gender_v4_D_params.csv",
                  targets     = "13JUN2025/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_B.csv",
                  #targets     = "09JUN2026LATE/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_B_no_inci.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
sum(!output$hits$fit)


paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "09JUN2026LATE/VNM2025-06-09_15h03m54sVNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim_215of238_thetaA15_optim_09JUN2025_exp_Eoptim.xml",
                  #parameters  = "09JUN2026LATE/VNM_XMLinput_C_SES_for_gender_exp_F_params.csv",
                  targets     = "09JUN2026LATE/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_B.csv",
                  #targets     = "09JUN2026LATE/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_B_no_inci.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
sum(!output$hits$fit)



# 9 JUNE 2025 22h46
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "09JUN2026LATE/VNM_XMLinput_C_SES_for_gender_exp_F.xml",
                  parameters  = "09JUN2026LATE/VNM_XMLinput_C_SES_for_gender_exp_F_params.csv",
                  targets     = "09JUN2026LATE/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_B_no_inci_weighted.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv", pwr=0)

df = read.csv(file="./countries/VNM/parameters/09JUN2026LATE/VNM_inputseeds.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")




paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "09JUN2025/VNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim_215of238_thetaA15_optim_09JUN2025_exp_E.xml",
                  parameters  = "09JUN2025/VNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim__params_exp_E.csv",
                  targets     = "09JUN2025/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_B.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv", pwr=0)

df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v3_E.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "08JUN2025/VNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim_215of238_thetaA15.xml",
                  parameters  = "08JUN2025/VNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim__params.csv",
                  targets     = "08JUN2025/VNM_targets_09JUN25_ALL_180_MFOK_notif_age_sex_Dc_min_A.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv",pwr=0 )

df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v3_A.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")



run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "A15A25/VNM_XMLinput_C_SES_for_gender_v2_P_optim.xml",
                  parameters  = "A15A25/VNM_XMLinput_C_SES_for_gender_v2_P_params.csv",
                  #parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params.csv",
                  #parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params_modA.csv",
                  targets     = "A15A25/VNM_targets_26MAY25_NOTALL_Dc.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "A15A25/VNM_XMLinput_C_SES_for_gender_v2_P_optim_A15.xml",
                  parameters  = "A15A25/VNM_XMLinput_C_SES_for_gender_v2_P_params_A15_all_shneg.csv",
                  #parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params.csv",
                  #parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params_modA.csv",
                  targets     = "A15A25/VNM_targets_26MAY25_NOTALL.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

df = read.delim(file="./countries/VNM/mcmc_seeds/VNM_XMLinput_C_SES_for_gender_v2_P_input_seeds.txt")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv",pwr=3)


run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "VNM_XMLinput_C_SES_for_gender_v2_P_optim.xml",
                  parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params.csv",
                  #parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params_modA.csv",
                  targets     = "VNM_targets_26MAY25_ALL.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_P.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")




paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "VNM_XMLinput_C_SES_for_gender_v2_P_optim_agedepprog2.xml",
                  parameters  = "VNM_XMLinput_C_SES_for_gender_v2_P_params_modA25_3.csv",
                  targets     = "VNM_targets_26MAY25_ALL.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)
# NOTE: 119 with XML above
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_P_A1525v2.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
output=run(paths,new.parameter.values = p, write.to.file = T)
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv",pwr=3)



# df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2.csv")
# df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_N.csv")
df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seed_C_SES_for_gender_v2_P_A1525.csv")
i=1
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")



logdf=read.delim(file="./countries/VNM/logs/[VNM][2024-11-05_00h02m46s][][3_6_0][VNM_XMLinput_E][optim].log")
optim=logdf[23,-c(1:7)]
v=as.numeric(optim)
names(v)=names(optim)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")
df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seeds.csv")
for (i in 2:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\n")
  run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")
}


run.optimizer(paths, lmcontrolcsv="./code-demos/levmarq.csv", nruns=2)
  
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