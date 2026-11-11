rm(list=ls())
require(tbmod)

paths = set.paths(countries   = "countries", 
                  countrycode = "IND", 
                  xml         = "XMLinput_NIH2.xml",
                  lglevel     = "INFO")

output=run(paths,write.to.file = T)
