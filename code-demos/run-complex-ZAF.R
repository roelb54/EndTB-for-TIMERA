rm(list=ls())
require(endTB)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

# include targets
paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF.xml",
                  targets     = "target.csv",
                  lglevel     = "INFO")


output=run(paths,write.to.file = T)
sum(output$hits$fit !=T)

# include targets and parameters replacement file
paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF.xml",
                  parameters  = "input.csv",
                  targets     = "target.csv",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
sum(output$hits$fit !=T)

# include targets and parameters replacement file and use sampled parameter values
# note that the currently used parameters do not fit the targets very well
df = read.csv(file="./countries/ZAF/paramsets.csv")
for (i in 1:nrow(df)){
  p = as.numeric(df[i,3:ncol(df)])
  names(p)=names(df[3:ncol(df)])
  cat("i=",i,"\n")
  z=run(paths, new.parameter.values = p)
  print(paste0(sum(z$hits$fit)," hits out of ",length(z$hits$fit)," targets"))
}
