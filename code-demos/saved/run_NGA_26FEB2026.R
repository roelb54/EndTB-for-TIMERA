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
baseline=run(paths,write.to.file = T) 
sum(baseline$hits$fit)
View(baseline$hits)
run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

# stick to the fit above i.e. TPT/NGA_XMLinput_OK2PM26FEB_42hits.xml !
# do TPT from here

df_1 = baseline$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year[1:16],TB_incidence_per_100K[1:16],type="b",col="blue",lwd=2,ylim=c(0,400))
