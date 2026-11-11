rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits.xml",
                  targets     = "TPT/ETH_targets_TPT_no_projection_F.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = T) 
sum(baseline$hits$fit)
View(baseline$hits)




# baseline







df=read.csv("countries/ETH/parameters/TPT/ETH_targets_TPT_projection_F.csv")
notif=df[df$type=="c_newinc_100k",]
year=notif$year[1:10]
low= notif$lo[1:10]
hi= notif$hi[1:10]
value=notif$value[1:10]

IGRA_all=df[df$type=="IGRA_ALL",]
year=IGRA_all$year
value=IGRA_all$model





library(plotrix)
plotCI(year,value,low,hi,xlim=c(2000,2050))

df_1 = baseline$hits
DsDc_all=df_1[df_1$type=="prev_ALL",]
year=DsDc_all$year
value=DsDc_all$model
plot(year,value,type="b",lwd=2,col="blue",ylim=c(0,200))
df_2=TPT40$hits
DsDc_all=df_2[df_2$type=="prev_ALL",]
year=DsDc_all$year
value=DsDc_all$model
lines(year,value,type="b",lwd=2,col="red")

df_1 = baseline$hits
IGRA_all=df_1[df_1$type=="IGRA_ALL",]
year=IGRA_all$year
value=IGRA_all$model
plot(year,value,type="b",lwd=2,col="blue",ylim=c(0,15000))
df_2=TPT40$hits
IGRA_all=df_2[df_2$type=="IGRA_ALL",]
year=IGRA_all$year
value=IGRA_all$model
lines(year,value,type="b",lwd=2,col="red")
df_3=TPT40to0$hits
IGRA_all=df_3[df_3$type=="IGRA_ALL",]
year=IGRA_all$year
value=IGRA_all$model
lines(year,value,type="b",lwd=2,col="purple")

sel = (df_1$type=="c_newinc_100k")
TB_notifs_per_100K = df_1[sel,]$model
year = df_1[sel,]$year


lines(year,TB_notifs_per_100K,type="b",col="blue",lwd=2)


paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT00_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #parameters      = "TPT/ETH_XMLinput_params_B.csv",
                  targets     = "TPT/ETH_targets_TPT_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
baseline=run(paths,write.to.file = T, write.xml = "why.xml") 
sum(baseline$hits$fit)
View(baseline$hits)

df = read.csv("./countries/ETH/parameters/TPT/ETH_XMLinput_params_B.csv")
# df[212,] OK 
p = as.numeric(df$mean[df$choose==TRUE])
names(p)=df$unique.name[df$choose==TRUE]

run.optimizer(paths, new.parameter.values= p,lmcontrolcsv = "./code-demos/levmarq.csv", pwr=-2)


# stick to the fit above? i.e. TPT/ETH_XMLinput_OK2PM01MAR_47hits.xml !
# do TPT from here

df_1 = baseline$hits
#df_1 = df_1[df_1$year>=2010,]

sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,250))

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT40_tozeroin2040_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #parameters      = "TPT/ETH_XMLinput_params_B.csv",
                  targets     = "TPT/ETH_targets_TPT_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
TPT40to0=run(paths,write.to.file = T) 

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH",
                  xml         = "TPT/ETH_XMLinput_OK2PM01MAR_47hits_TPT40_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_2000thru2050.xml",
                  #xml         = "TPT/NGA_XMLinput_OK2PM26FEB_42hits_TPT00_2000thru2050.xml",
                  #parameters      = "TPT/ETH_XMLinput_params_B.csv",
                  targets     = "TPT/ETH_targets_TPT_projection_F.csv",
                  #targets     = "TPT/NGA_targets_TPT_projection_2000thru2050.csv",
                  lglevel     = "INFO")
TPT40=run(paths,write.to.file = T) 

df_1 = TPT40$hits
df_1 = df_1[df_1$year>=2010,]

sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)
