rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)
# baseline
paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #targets     = "TPT/NGA_targets_TPT_no_projection_F.csv",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = F) 
sum(baseline$hits$fit)
df_1 = baseline$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,300))#,xlim=c(2015,2050))

paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT40_2000thru2050.xml",
                  #targets     = "TPT/NGA_targets_TPT_no_projection_F.csv",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) 

df_1 = output$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence_per_100K,type="b",lwd=2,col="red")#,xlim=c(2015,2050))
