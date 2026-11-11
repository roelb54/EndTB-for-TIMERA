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
sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,150), ylab = "TB incidence per 100,000")#,xlim=c(2015,2050))

paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT30_from_2026_2000thru2050.xml",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
tpt30=run(paths,write.to.file = F) 

df_4 = tpt30$hits
sel = (df_4$type=="e_inc_100k_ALL" & df_4$year>=2025)
TB_incidence_per_100K = df_4[sel,]$model
year = df_4[sel,]$year
lines(year,TB_incidence_per_100K,type="b",lwd=2,col="darkgreen")#,xlim=c(2015,2050))

paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT60_from_2026_2000thru2050_5yrag.xml",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
tpt60=run(paths,write.to.file = T) 

df_5 = tpt60$hits
sel = (df_5$type=="e_inc_100k_ALL" & df_5$year>=2025)
TB_incidence_per_100K = df_5[sel,]$model
year = df_5[sel,]$year
#plot(year,TB_incidence_per_100K,type="b",lwd=2,col="orange")#,xlim=c(2015,2050))
lines(year,TB_incidence_per_100K,type="b",lwd=2,col="orange")#,xlim=c(2015,2050))

paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT90_from_2026_2000thru2050.xml",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
tpt90=run(paths,write.to.file = F) 

df_6 = tpt90$hits
sel = (df_6$type=="e_inc_100k_ALL" & df_6$year>=2025)
TB_incidence_per_100K = df_6[sel,]$model
year = df_6[sel,]$year
lines(year,TB_incidence_per_100K,type="b",lwd=2,col="red")#,xlim=c(2015,2050))

title("Impact of test and treat in Nigeria")

legend("topright", legend=c("baseline","30% p/yr", "60% p/yr","90% p/yr"), 
       fill = c("blue","darkgreen","orange","red"))



paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT75_from_2026_2000thru2050.xml",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) 

df_2 = output$hits
sel = (df_2$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_2[sel,]$model
year = df_2[sel,]$year
lines(year,TB_incidence_per_100K,type="b",lwd=2,col="red")#,xlim=c(2015,2050))



paths = set.paths(countries   = "countries", 
                  countrycode = "NGA",
                  xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT50_from_2026_2000thru2050.xml",
                  targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
tpt50=run(paths,write.to.file = F) 

df_3 = tpt50$hits
sel = (df_3$type=="e_inc_100k_ALL" & df_3$year>=2025)
TB_incidence_per_100K = df_3[sel,]$model
year = df_3[sel,]$year
lines(year,TB_incidence_per_100K,type="b",lwd=2,col="purple")#,xlim=c(2015,2050))




