rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)
# baseline
paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_thru2050.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall_00_2010thru2050_5yAG.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_F_2010thru2050.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = F) 
sum(baseline$hits$fit)
#View(baseline$hits)
df_1 = baseline$hits
sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,250),ylab="TB incidence per 100,000")

# OK, let's stick to the fit above !!! 26 FEB 2026
# we do need the input.csv

paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall_30_2010thru2050.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_F_2010thru2050.csv",
                  #targets     = "TPT/targets_38_age_dep_TPT_projection_D.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) 
df_30 = output$hits
sel = (df_30$type=="e_inc_100k_ALL" & df_30$year>=2025)
TB_incidence_per_100K = df_30[sel,]$model
year = df_30[sel,]$year

lines(year,TB_incidence_per_100K,type="b",col="darkgreen",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall_60_2010thru2050.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_F_2010thru2050.csv",
                  #targets     = "TPT/targets_38_age_dep_TPT_projection_D.csv",
                  lglevel     = "INFO")
output60=run(paths,write.to.file = F) 
df_12 = output60$hits
sel = (df_12$type=="e_inc_100k_ALL" & df_12$year>=2025)
TB_incidence_per_100K = df_12[sel,]$model
year = df_12[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="orange",lwd=2)
paths = set.paths(countries   = "countries", 
                  countrycode = "MOZ",
                  #xml         = "TPT/MOZ_XMLinput_ag_optim_35of38.xml",
                  xml         = "TPT/MOZ_XMLinput_ag_optim_35of38_TPTall_90_2010thru2050.xml",
                  parameters  = "TPT/MOZ_XMLinput_ag_optim_params_B_lowerpT.csv",
                  targets     = "TPT/targets_38_age_dep_TPT_projection_F_2010thru2050.csv",
                  #targets     = "TPT/targets_38_age_dep_TPT_projection_D.csv",
                  lglevel     = "INFO")
output90=run(paths,write.to.file = F) 
df_12 = output90$hits
sel = (df_12$type=="e_inc_100k_ALL" & df_12$year>=2025)
TB_incidence_per_100K = df_12[sel,]$model
year = df_12[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)

title("Impact of test and treat in Mozambique")

legend("topright", legend=c("baseline","30% p/yr", "60% p/yr","90% p/yr"), 
       fill = c("blue","darkgreen","orange","red"))

