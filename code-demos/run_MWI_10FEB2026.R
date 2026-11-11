rm(list=ls())
source("./R/include-v11.R")
source("./R/TBVx-run-v1.R")
source("./R/TBVx-optimization-fncs-v2.R")
taskenvvar="taskID"
#require(endTB)

paths = set.paths(countries   = "countries", 
                  countrycode = "MWI", 
                  xml         = "XMLinput_baseline.xml",
                  #xml         = "MWI_complex-ZAF-MWI-altC_optim.xml",
                  #parameters = "inputC.csv",
                  parameters = "inputB.csv",
                  targets     = "target.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = F) #, write.xml="check_assortativity.xml")
sum(output$hits$fit)

# consider this a fit ...
# now TPT

run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")

df = read.csv(file="./countries/MWI/parameters/inputB.csv")
df = df[df$choose==T,]
p = as.numeric(df$mean)
names(p)=df$unique.name
#run.optimizer(paths, lmcontrolcsv = "./code-demos/levmarq.csv")
run.optimizer(paths, new.parameter.values = p, lmcontrolcsv = "./code-demos/levmarq.csv")
