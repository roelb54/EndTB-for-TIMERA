rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)
# baseline

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT00_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  parameters      = "TPT/ETH_optim_params.csv",
                  targets     = "TPT/ETH_targets_TPT_no_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = F) 
sum(baseline$hits$fit)

df = read.csv("./countries/ETH/parameters/TPT/ETH_optim_params.csv")
p = as.numeric(df$mean[df$choose==TRUE])
names(p)=df$unique.name[df$choose==TRUE]
run.optimizer(paths, new.parameter.values= p,lmcontrolcsv = "./code-demos/levmarq.csv")


# stick to the fit above? i.e. TPT/ETH_XMLinput_OK2PM01MAR_47hits.xml !
# do TPT from here

df_1 = baseline$hits
#df_1 = df_1[df_1$year>=2010,]

sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,120),ylab="TB incidence per 100,000")

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT30_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #parameters      = "TPT/ETH_XMLinput_params_B.csv",
                  targets     = "TPT/ETH_targets_TPT_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
TPT30=run(paths,write.to.file = F) 
df_1 = TPT30$hits
sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="darkgreen",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT60_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #parameters      = "TPT/ETH_XMLinput_params_B.csv",
                  targets     = "TPT/ETH_targets_TPT_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
TPT60=run(paths,write.to.file = F) 

df_1 = TPT60$hits

sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="orange",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT90_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #parameters      = "TPT/ETH_XMLinput_params_B.csv",
                  targets     = "TPT/ETH_targets_TPT_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
TPT90=run(paths,write.to.file = F) 


df_1 = TPT90$hits

sel = (df_1$type=="e_inc_100k_ALL" & df_1$year>=2025)
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)

title("Impact of test and treat in Ethiopia")

legend("topright", legend=c("baseline","30% p/yr", "60% p/yr","90% p/yr"), 
       fill = c("blue","darkgreen","orange","red"))
