rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"

#require(endTB)
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "VNM_XMLinput_E.xml",
                  parameters  = "VNM_params_F.csv",
                  targets     = "VNM_targets_2000_2023_D.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit)

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
