# checked for endTB 3.6.1
rm(list=ls())
require(endTB)

paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "SIR.xml")
output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "SEIR-SES.xml")
output=run(paths,write.to.file = T)

paths = set.paths(countries   = "countries", countrycode = "ZAF", xml = "SEIR-SES-Iinci.xml")
output=run(paths,write.to.file = T)



