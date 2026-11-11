rm(list=ls())
# model = new.env()
# for debugging set model to globalenv():
model = globalenv()
source(here::here("R","include-v11.R"),model)
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"
seed=60
set.seed(seed)
Sys.setenv(taskID=seed^2)

model$paths = model$set.paths(countries   = "countries-examples", 
                              countrycode = "IND", 
                              xml         = "XML_modified_input.xml")
outputA = run(model, write.to.file = T)
              
model$paths = model$set.paths(countries   = "countries-examples", 
                              countrycode = "IND", 
                              xml         = "XML_modified_input.xml",
                              parameters  = "input_IND_modified5050AB.csv",
                              targets     = "targets_IND_em_10A.csv")
pparams = c(0.4,0.8)
names(pparams)=c("eta","zeta")

outputE = run(model, write.to.file = T, new.parameter.values = pparams,
              write.xml = "XML_modified_input_updated_with_input_IND_modified5050ABppsampled.xml")

# with age.group.lower.limits="c(0,15)"
model$paths = model$set.paths(countries   = "countries-examples", 
                              countrycode = "IND", 
                              xml         = "XML_modified_inputB.xml",
                              parameters  = "input_IND_modified5050.csv",
                              targets     = "targets_IND_em_10B.csv")
outputB = run(model, write.to.file = T, write.xml   = "whatthehell.xml")




