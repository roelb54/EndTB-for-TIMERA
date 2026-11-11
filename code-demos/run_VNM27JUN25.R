rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"

#require(endTB)
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/27JUN25_226/230of239/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vA_optim.xml",
                  parameters  = "/27JUN25_226/230of239/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vA_optim_params.csv",
                  #parameters  = "/27JUN25_226/230of239/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vA_optim_params.csv",
                  targets     = "/27JUN25_226/230of239/VNM2025-06-08_14h08m59s_239targets_OK_vA.csv",
                  #targets     = "/27JUN25_226/230of239/VNM2025-06-08_14h08m59s_239targets_FORCE_230.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F)
sum(output$hits$fit)

df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seeds_MOD_230_vZ.csv")
i = 1 ; p = as.numeric(df[i,3:ncol(df)])  ; names(p)=names(df[3:ncol(df)])
output=run(paths,new.parameter.values = p,write.to.file = F)
sum(output$hits$fit)

run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")


output=run(paths,new.parameter.values = p,write.to.file = T, write.xml = "mostof239.xml")
sum(output$hits$fit)


run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv",pwr=0)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")



paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/216of238/VNM2025-06-08_14h08m59sVNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim.xml",
                  parameters  = "/216of238/VNM2025-06-08_14h08m59sVNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim_params.csv",
                  targets     = "/216of238/VNM2025-06-08_14h08m59s_239targets_OK_vA.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = F)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")
df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seeds.csv")
  i = 1
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\n")
  output=run(paths, new.parameter.values = p, write.to.file = T)
  
  run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")



paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/216of238/VNM_XMLinput_C_SES_for_gender_v5_JE_C.xml",
                  parameters  = "/216of238/VNM_XMLinput_C_SES_for_gender_v5_JE_C_params.csv",
                  targets     = "/216of238/VNM2025-06-08_14h08m59s_239targets_OK_vA.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = F)
sum(output$hits$fit)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

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
