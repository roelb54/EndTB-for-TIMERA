rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)

paths = set.paths(countries   = "countries", 
                  countrycode = "MWI",
                  #xml         = "complex-ZAF-MWI-altC.xml",
                  xml         = "MWI_complex-ZAF-MWI-altC_optim.xml",
                  #xml         = "XMLinput_baseline_red_B.xml",
                  #parameters = "input_altE.csv",
                  targets     = "MWI_targets_altE.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
sum(output$hits$fit)
View(output$hits)




# NOW TPT
paths = set.paths(countries   = "countries", 
                  countrycode = "MWI",
                  #xml         = "TPT/MWI-altC_optim_TPT0_checkE.xml",
                  xml         = "TPT/MWI-altC_optim_TPT0_singleYAG.xml", # i.e. baseline 
                  #targets     = "MWI_targets_altE.csv",
                  targets     = "TPT/MWI_targets_altE_output_OK.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
sum(output$hits$fit)
df_0 = output$hits
sel = (df_0$type=="e_inc_100k_ALL" & df_0$year>2020)
TB_incidence_per_100K = df_0[sel,]$model
year = df_0[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,150))

paths = set.paths(countries   = "countries", 
                  countrycode = "MWI",
                  #xml         = "TPT/MWI-altC_optim_TPT0_checkE.xml",
                  xml         = "TPT/MWI-altC_optim_TPT40_singleYAG_ALL50plus.xml", # i.e. baseline 
                  #targets     = "MWI_targets_altE.csv",
                  targets     = "TPT/MWI_targets_altE_output50_OK.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
sum(output$hits$fit)
df_1 = output$hits
sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>2020)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)




# consider this a fit ...
# now TPT

df = read.csv(file="./countries/MWI/parameters/MWI_input_seeds.csv")
p = as.numeric(df[1,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
p[["sh"]]=0.2
p[["midx"]]=2007
p[["muH"]]=0.1
p[["betaH"]]=0.074
output=run(paths, new.parameter.values = p, write.to.file = F)
sum(output$hits$fit)
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv", pwr = -2)

for (i in 1:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  output=run(paths, new.parameter.values = p, write.to.file = F)
  cat("i=",i,"nhits=",sum(output$hits$fit),"of",nrow(output$hits),"\n")
}

p = as.numeric(df[16,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")

#run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

