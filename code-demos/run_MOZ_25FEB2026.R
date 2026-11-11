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
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_thru2050.xml",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_noTPTall_till_2070.xml",
                  #parameters  = "input_FM.csv",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  #targets     = "TPT/targets_38_age_dep_TPT_no_projection_F_from_2010.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_F_2010thru2050.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = F) 
sum(baseline$hits$fit)
View(baseline$hits)
df_1 = baseline$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model[-1]
year = df_1[sel,]$year[-1]
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,400),xlim=c(2015,2050))

# OK, let's stick to the fit above !!! 26 FEB 2026
# we do need the input.csv

paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall_40_2010thru2050.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_F_2010thru2050.csv",
                  #targets     = "TPT/targets_38_age_dep_TPT_projection_D.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) 
df_11 = output$hits
sel = (df_11$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_11[sel,]$model
year = df_11[sel,]$year


lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)
title("Mozambique",sub="Impact of test and treat (40% per year)")


df = read.csv("./countries/MOZ/logs/MOZ_XMLinput_ag_optim_35of38optim55log.csv")
# df[212,] OK 
p = as.numeric(df[35,8:ncol(df)])
names(p)=colnames(df)[8:ncol(df)]

best=run(paths,new.parameter.values = q, write.to.file = T) 
sum(best$hits$fit)
run.optimizer(paths, new.parameter.values = q, lmcontrolcsv = "./code-demos/levmarq.csv", pwr=-2)



df = read.csv(file="./countries/MOZ/parameters/TPT/MOZ_XMLinput_ag_optim_params.csv")
p = df[df$choose==TRUE,]$mean
names(p) = df[df$choose==TRUE,]$unique.name
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")



df_1 = baseline$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,400))

# intervention

paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall_40_from_2030_till_2070.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_D.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) 
df_11 = output$hits
sel = (df_11$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_11[sel,]$model
year = df_11[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)
title("Mozambique",sub="Impact of test and treat (40% per year)")


paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall2030_40.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_B.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) 
df_12 = output$hits
sel = (df_12$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_12[sel,]$model
year = df_12[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="orange",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall2027_80_2040_0_immediate.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_B.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) 
df_13 = output$hits
sel = (df_13$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_13[sel,]$model
year = df_13[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="purple",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall2030_80_2050_0_till_2070.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_D.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) 
df_13 = output$hits
sel = (df_13$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_13[sel,]$model
year = df_13[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="purple",lwd=2)



run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")




View(baseline$hits)

df = read.csv("./countries/MOZ/mcmc_seeds/MOZ_input_seeds.csv")
p = as.numeric(df[1,3:ncol(df)])
names(p)=colnames(df)[3:ncol(df)]

baseline_ok=run(paths,new.parameter.values = p,write.to.file = T) 
sum(baseline_ok$hits$fit)


df = read.csv("./countries/MOZ/logs/MOZ_XMLinput_optim_25_of_28_log.csv")
# df[212,] OK 
p = as.numeric(df[212,8:ncol(df)])
names(p)=colnames(df)[8:ncol(df)]


run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")



df_0 = baseline$hits
sel = (df_0$type=="e_inc_100k_ALL" & df_0$year>2020)
TB_incidence_per_100K = df_0[sel,]$model
year = df_0[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,150))


# NOW TPT
paths = set.paths(countries   = "countries", 
                  countrycode = "MWI",
                  #xml         = "TPT/MWI-altC_optim_TPT0_checkE.xml",
                  #xml         = "TPT/MWI-altC_optim_TPT0_singleYAG.xml", # i.e. baseline 
                  xml         = "TPT/MWI-altC_optim_TPT_hh_cov80.xml",
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

df = read.csv(file="./countries/MOZ/parameters/TPT/MOZ_TPT0_5YAGoptimlog.csv")
p = as.numeric(df[17,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
#p[["sh"]]=0.2
#p[["midx"]]=2007
#p[["muH"]]=0.1
#p[["betaH"]]=0.074
output=run(paths, new.parameter.values = p, write.to.file = T)
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

