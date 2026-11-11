rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_baseline.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
df_11 = output$hits
sel = (df_11$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_11[sel,]$model
year = df_11[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="black",lwd=2,ylim=c(0,125))

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_TPTALL2030_0p8_withDsDctreat.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
df_8 = output$hits
sel = (df_8$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_8[sel,]$model
year = df_8[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="blue",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_TPTB45plus2030_0p8_withDsDctreat.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
df_9 = output$hits
sel = (df_9$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_9[sel,]$model
year = df_9[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="red",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_TPTM45plus2030_0p8_withDsDctreat.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")

df_10 = output$hits
sel = (df_10$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_10[sel,]$model
year = df_10[sel,]$year
lines(year,TB_incidence_per_100K,type="b",col="darkgreen",lwd=2)





# 20 JAN 2026 13h31
# 224 targets hit 
# and output on prev / inci 2025 thru 2050
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_baseline.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
sum(output$hits$fit)
df_0 = output$hits
sel = (df_0$type=="e_inc_100k_ALL")
TB_incidence_per_100K = df_0[sel,]$model
year = df_0[sel,]$year
plot(year,TB_incidence_per_100K,type="b",col="blue",lwd=2,ylim=c(0,125))

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_TPTall2030_0p4_noDsDctreat.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
df_7 = output$hits
sel = (df_7$type=="e_inc_100k_ALL")
TB_incidence = df_7[sel,]$model
year = df_7[sel,]$year
lines(year,TB_incidence,type="b",col="red",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_TPTall2030_0p4_withDsDctreat.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
df_8 = output$hits
sel = (df_8$type=="e_inc_100k_ALL")
TB_incidence = df_8[sel,]$model
year = df_8[sel,]$year
lines(year,TB_incidence,type="b",col="darkgreen",lwd=2)



paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACFALL2_noTPTall.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
df_7 = output$hits
sel = (df_7$type=="e_inc_100k_ALL")
TB_incidence = df_7[sel,]$model
year = df_7[sel,]$year
lines(year,TB_incidence,type="b",col="red",lwd=2)




paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACFALL2_TPTall2035.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
df_1 = output$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_incidence = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_incidence,type="b",col="purple",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACF45M_TPT_factor0.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
df_7 = output$hits
sel = (df_7$type=="e_inc_100k_ALL")
TB_incidence = df_7[sel,]$model
year = df_7[sel,]$year
lines(year,TB_incidence,type="b",col="red",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACF45M_TPT_factor5.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")
df_8 = output$hits
sel = (df_8$type=="e_inc_100k_ALL")
TB_incidence = df_8[sel,]$model
year = df_8[sel,]$year
lines(year,TB_incidence,type="b",col="purple",lwd=2)



paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_noACF55M_TPT_factor4.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55_2045.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
df_3 = output$hits
sel = (df_3$type=="e_inc_100k_ALL")
TB_incidence = df_3[sel,]$model
year = df_3[sel,]$year
lines(year,TB_incidence,type="b",col="green",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACF55M_noTPT2p5.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55_2045.csv",
                  lglevel     = "INFO")
acf55m=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
sum(acf55m$hits$fit)
df_4 = acf55m$hits
sel = (df_4$type=="e_inc_100k_ALL")
TB_incidence = df_4[sel,]$model
year = df_4[sel,]$year
lines(year,TB_incidence,type="b",col="purple",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACF55M_TPT_factor4.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA_A55_2045.csv",
                  lglevel     = "INFO")
acf55mTPT5=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
sum(acf55mTPT5$hits$fit)

df_5 = acf55mTPT5$hits
sel = (df_5$type=="e_inc_100k_ALL")
TBincidence = df_5[sel,]$model
year = df_0[sel,]$year
lines(year,TBincidence,type="b",col="black",lwd=2)


df_prev = acf55mTPT5$hits
sel = (df_prev$type=="prev_A55M")
TBprev = df_0[sel,]$model
year = df_0[sel,]$year
plot(year,TBprev,type="b",col="blue",lwd=2,ylim=c(0,10000))


df_0 = baseline$hits
sel = (df_0$type=="e_inc_100k_ALL")
TB_incidence = df_0[sel,]$model
year = df_0[sel,]$year
plot(year,TB_incidence,type="b",col="blue",lwd=2,ylim=c(0,150))

df_1 = noacf55mTPT5$hits
sel = (df_1$type=="e_inc_100k_ALL")
TB_TPT = df_1[sel,]$model
year = df_1[sel,]$year
lines(year,TB_TPT,type="b",col="darkgreen",lwd=2)

df_2 = acf55m$hits
sel = (df_2$type=="e_inc_100k_ALL")
TB_TPT = df_2[sel,]$model
year = df_2[sel,]$year
lines(year,TB_TPT,type="b",col="red",lwd=2)

df_3 = acf55mTPT5$hits
sel = (df_3$type=="e_inc_100k_ALL")
TB_TPT = df_3[sel,]$model
year = df_3[sel,]$year
lines(year,TB_TPT,type="b",col="purple",lwd=2)

paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/TPT/VNM_XMLinput_ACF_TPT_factor3_A0_hh2p4.xml",
                  targets     = "/TPT/VNM_targets_MOD_vA_ORIGINAL_and_OK_for_TPToutput_IGRA.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T) #, write.xml="check_assortativity.xml")

#df_0 = output$hits
sel = (df_0$type=="e_inc_100k_ALL")
TB_incidence = df_0[sel,]$model
year = df_0[sel,]$year
plot(year,TB_incidence,type="b",col="blue",lwd=2,ylim=c(0,150),main = "effect of ACF (and TPT) on TB incidence")

#df_2 = output$hits
sel = (df_2$type=="e_inc_100k_ALL")
TB_ACF = df_2[sel,]$model
year = df_2[sel,]$year
lines(year,TB_ACF,type="b",col="darkgreen",lwd=2)

#df_3 = output$hits
sel = (df_3$type=="e_inc_100k_ALL")
TB_ACF_TPT = df_3[sel,]$model
year = df_3[sel,]$year
lines(year,TB_ACF_TPT,type="b",col="purple",lwd=2)


selIGRA = (df_0$type=="IGRA_ALL")
IGRAprev = df_0[selIGRA,]$model
year = df_0[selIGRA,]$year
plot(year,IGRAprev,type="b",col="blue",lwd=2,ylim=c(0,6000))
# IGRA 5200 per 100,000 i.e. 5.2% 
# factor 3 voor households met TB case => 15.6%
# Fox: 20 a 30 % ?
# dus totale multiplier = 5 
