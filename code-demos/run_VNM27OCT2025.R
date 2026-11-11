rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)

# 11 NOV 2025 10h50
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/218of229/VNM_2025-10-27_00h36m54s_2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optim.xml",
                  #xml         = "/214of229/[VNM][2025-10-26_23h42m54s_2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass1_1_92_optim_pEt1_sage3_213of229optim.xml",
                  parameters  = "/26OCT2025/2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optimj4A25.csv",
                  #parameters  = "/214of229/[VNM][2025-10-26_23h42m54s_2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optim_params.csv",
                  targets     = "/26OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexDminHai.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)
sum(output$hits$fit)

df = read.csv(file="./countries/VNM/parameters/26OCT2025/2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_218of229optim_params_B.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")


# 23 OCT 2025 13h45
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  #xml         = "/21OCT2025/2025-09-23_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim.xml",
                  xml         = "/21OCT2025/2025-09-23_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3.xml",
                  parameters  = "/21OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params_pEt1Asage3E.csv",
                  #targets     = "/9OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD_force_A.csv",
                  targets     = "/21OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexDminHai.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)
sum(output$hits$fit)

df = read.csv(file="./countries/VNM/parameters/21OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params_pEt1Asage3E.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")





# 21 OCT 2025 10h10
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/21OCT2025/2025-09-23_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim.xml",
                  parameters  = "/21OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params.csv",
                  #targets     = "/9OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD_force_A.csv",
                  targets     = "/21OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)#, write.xml = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_231_of_239.xml")
sum(output$hits$fit)

df = read.csv(file="./countries/VNM/parameters/21OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")



# 21 OCT 2025 10h00
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/9OCT2025/2025-09-23_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim.xml",
                  parameters  = "/9OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params.csv",
                  #targets     = "/9OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD_force_A.csv",
                  targets     = "/9OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)#, write.xml = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_231_of_239.xml")
sum(output$hits$fit)


# 9 OCT 2025 12h00
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/9OCT2025/2025-09-23_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_Ls2_Ds2_A.xml",
                  #parameters  = "/9OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params.csv",
                  #targets     = "/9OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD_force_A.csv",
                  targets     = "/9OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)#, write.xml = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_231_of_239.xml")
sum(output$hits$fit)
# 225 hits of 245
df = read.csv(file="./countries/VNM/parameters/9OCT2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_params.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")




run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")



# 16? AUG 2025 16h00
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass100.xml",
                  #targets     = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK.csv",
                  targets     = "/22SEP2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexD.csv",
                  #parameters  = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_optim_B.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)#, write.xml = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_231_of_239.xml")
sum(output$hits$fit)
df = read.csv(file="./countries/VNM/parameters/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_optim_B.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")


# 22 SEP 2025 17h00
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22.xml",
                  parameters  = "/22SEP2025/VNM2025-06-08_14h08m59sVNM_XMLinput_C_SES_for_gender_v3_A_optim__1__86__optim_params_nopTagemult_ass_pEf2.csv",
                  #parameters  = "/23JUN25_214of239NEW/VNM_XMLinput_C_SES_for_gender_v3_B_MOD_230_params_assort.csv",
                  targets     = "/22SEP2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexB.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)#, write.xml = "/22SEP2025/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_231_of_239.xml")
sum(!output$hits$fit)
# 218 hits of 245
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seeds_MOD_230_vZ.csv")
i = 1 ; p = as.numeric(df[i,3:ncol(df)])  ; names(p)=names(df[3:ncol(df)])
q = p[names(p)!="j4A15"]
output=run(paths,new.parameter.values = q ,write.to.file = T)#, write.xml = "VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_15JUL25.xml")
sum(output$hits$fit)

run.optimizer(paths, new.parameter.values = q, lmcontrolcsv = "./code-demos/levmarq.csv")






paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/23JUN25_214of239NEW/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22.xml",
                  targets     = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T, write.xml = "VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_16JUL25_A.xml")
sum(output$hits$fit)
# 231 hits of 239

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/23JUN25_214of239NEW/VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22.xml",
                  targets     = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T, write.xml = "VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_16JUL25_A.xml")
sum(output$hits$fit)



paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59sVNM_XMLinput_C_SES_for_gender_v3_A_NEW_vE.xml",
                  parameters  = "/23JUN25_214of239NEW/VNM_XMLinput_C_SES_for_gender_v3_B_MOD_230_params_assort.csv",
                  #parameters  = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59sVNM_XMLinput_C_SES_for_gender_v3_A_NEW_vC_params.csv",
                  #targets     = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59s_239targets_NEW_vA.csv",
                  #targets     = "/23JUN25_214of239NEW/VNM2025-06-27_12h20m39sVNM_XMLinput_C_SES_for_gender_v3_A_NEW_vA_optim_TARGETS.csv",
                  targets     = "/23JUN25_214of239NEW/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK.csv",
                  #targets     = "/23JUN25_214of239NEW/VNM2025-06-27_12h20m39sVNM_XMLinput_C_SES_for_gender_v3_A_NEW_vA_optim_TARGETS_force_prev_15th.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T, write.xml = "VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_16JUL25_A.xml")

#df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seeds_NEW_vD.csv")
df = read.csv(file="./countries/VNM/mcmc_seeds/VNM_input_seeds_MOD_230_vZ.csv")
i = 1 ; p = as.numeric(df[i,3:ncol(df)])  ; names(p)=names(df[3:ncol(df)])
output=run(paths,new.parameter.values = p,write.to.file = T)#, write.xml = "VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vD_15JUL25.xml")
sum(output$hits$fit)

run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")
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
