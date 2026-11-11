rm(list=ls())
require(endTB)
model = globalenv()
#source(here::here("R","include-v11.R"),model)
#source(here::here("R","TBVx-run-v1.R"),T)
#taskenvvar="taskID"

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-MF-5yrag-pT0_00062.xml",
                  targets     = "target-MF-DS.csv",
                  lglevel     = "INFO")

base=run(paths,write.to.file = F)
base$hits$fit

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-MF-eta064-5yrag.xml",
                  targets     = "target-MF-DS.csv",
                  lglevel     = "INFO")

intv=run(paths,write.to.file = T, baseline = base)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-MF-A.xml",
                  targets     = "target-MF-DS.csv",
                  lglevel     = "INFO")

base=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-MF-B.xml",
                  targets     = "target-MF-DS-A.csv",
                  lglevel     = "INFO")

intv=run(paths,write.to.file = T, baseline = base)

# include targets
paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF.xml",
                  targets     = "target.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

# include targets and parameters replacement file
paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF.xml",
                  parameters  = "input.csv",
                  targets     = "target.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

# include targets and parameters replacement file and use sampled parameter values
df = read.csv(file="./countries/ZAF/parameters/paramsets.csv")
for (i in 1:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\n")
  z=run(paths, new.parameter.values = p)
  print(paste0(sum(z$hits$fit)," hits out of ",length(z$hits$fit)," targets"))
}
