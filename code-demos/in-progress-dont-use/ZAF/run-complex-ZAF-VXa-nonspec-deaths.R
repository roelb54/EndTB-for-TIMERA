

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "XMLinput_econ_M72_CI_POD_55_10yr_2030_adoadu_5yrag_update.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-5060-no-cm-pT-7e-3.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-5060-agexp-A-pT-7e-3.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-5060-agexp-B.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)


paths = set.paths(countries   = "countries", 
                  countrycode = "ZAF", 
                  xml         = "complex-ZAF-no-rescale-5060.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)

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
