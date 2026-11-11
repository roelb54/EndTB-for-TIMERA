# Testing household contact implementation

rm(list=ls())
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
library(ggplot2)
library(cowplot)
theme_set(theme_minimal_grid() + panel_border(color = "black"))

parameters <- fread("./countries/INDu/data/INDu_params.csv")

j = 150
params <- parameters[j, ]
params_uid <- params[, uid]
params <- params[, !c("uid", "nhits")]
params <- unlist(params)

paths_BL = set.paths(countries   = "countries", 
                           countrycode = "INDu", 
                           xml         = "XMLinput_baseline.xml", 
                           parameters  = "input_under.csv")

# Run the model with the parameter set
output = run(paths_BL, new.parameter.values = params, output.flows = T, baseline = NULL)

baseline_output <- output
scen_baseline = baseline_output 

testing <- output[["stocks"]]
testing <- testing[age_from == 0 & age_thru == 99]
testing <- testing[, !(c("SES", "HIV", "age_from", "age_thru"))]
testing <- testing[, year := floor(year)]                                   
testing <- testing[, value := sum(value), by = .(year, TB)]
testing <- testing[, .(year, value, TB)]
testing <- unique(testing)
testing <- testing[, Runtype := "baseline"]

paths_test = set.paths(countries   = "countries", 
                             countrycode = "INDu", 
                             xml         = "XMLinput_rations_HHC_all_none.xml", 
                             parameters  = "input_under.csv")


tests = run(paths_test, new.parameter.values = params, output.flows = T, write.to.file = T)

# Run the model with the parameter set
tests = run(paths_test, new.parameter.values = params, output.flows = T, baseline = scen_baseline)

testing2 <- tests[["stocks"]]
testing2 <- testing2[age_from == 0 & age_thru == 99]
testing2 <- testing2[, !(c("SES", "HIV", "age_from", "age_thru"))]
testing2 <- testing2[, year := floor(year)]
testing2 <- testing2[, value := sum(value), by = .(year, TB)]
testing2 <- testing2[, .(year, value, TB)]
testing2 <- unique(testing2)
testing2 <- testing2[, Runtype := "HHC"]

combined <- rbind(testing, testing2)

ggplot(combined[year > 2020])+
  geom_line(aes(x = year, y = value, col = Runtype)) + 
  facet_wrap(TB ~ ., scales = "free")


combined2 <- dcast(combined, year + TB ~ Runtype, value.var = "value")
combined2 <- combined2[, baseline := baseline*1000]
combined2 <- combined2[, HHC := HHC*1000]
combined2 <- combined2[, diff := (baseline - HHC)]


View(combined2[year>2020])

# ----- end
