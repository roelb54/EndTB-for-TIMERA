rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"


paths = set.paths(countries   = "countries", 
                  countrycode = "ETH", 
                  xml         = "XMLinput_ETH_EndTB360.xml",
                  parameters  = "input.csv",
                  targets     = "target_ETH_SUB_A_03_EndTB360.csv",
                  lglevel     = "DEBUG")

z = run(paths,write.to.file = F)
z$hits$fit


df = read.csv(file="./countries/ETH/parameters/ETH_params.csv")
for (i in 1:nrow(df)){
p = as.numeric(df[i,3:ncol(df)])
names(p)=names(df[3:ncol(df)])
cat("i=",i,"\n")
b=run(paths, new.parameter.values = p, write.to.file = F)
cat("# targets hit=",sum(b$hits$fit)," # targets NOT hit = ",sum(!b$hits$fit),"\n")
}

