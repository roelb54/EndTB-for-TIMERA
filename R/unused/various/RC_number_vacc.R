suppressPackageStartupMessages({
  rm(list=ls())
  #model = new.env()
  model = globalenv()
  library(here)
  library(data.table)
  library(renv)
  library(digest)
  library(log4r)
  library(fst)
  library(arrow)
  if (!require("getopt")) install.packages("getopt")
  library(getopt)
  library(logger)
  library(getopt)
  library(logger)
  library(ggplot2)
  library(cowplot)
  
  source(here("R","include-v11.R"), model)
  #source(here("R", "workflow", "run_param_set_econ_count.R"))
  source(here::here("R","TBVx-run-v1.R"), model)
  
  
})# Number being vaccinated in each year

model$paths = model$set.paths(countries   = "countries", 
                              countrycode = "IND", 
                              xml         = "BCGecon/XMLinput_BCG_NCI_POI_45_10yr_med_2025.xml", 
                              parameters  = "input.csv")

output = run(model, sample.parameters=F, write.to.file = F, combine.stocks.and.flows = F, output.flows = F)

# example alternative output in output$vaccinated i.e. flows at one point in time (numbers)
# vacc = output$vaccinated
# sel =    vacc$value > 0 & (vacc$age_from == 10 | vacc$age_from == 11) 
# View(vacc[sel,])

tb_vxa <- output$stocks[,!("RISK")]
tb_vxa <- tb_vxa[grep("count", tb_vxa$VXa),]
tb_vxa <- tb_vxa[!(year %% 0.5 == 0),]
tb_vxa <- tb_vxa[!(age_from == 0 & age_thru == 99),]

tb_vxa <- tb_vxa[age_from == 0  & age_thru == 0, AgeGrp := "[0,0]"]
tb_vxa <- tb_vxa[age_from == 80  & age_thru == 89, AgeGrp := "(80,89]"]
tb_vxa <- tb_vxa[age_from == 90  & age_thru == 99, AgeGrp := "(90,99]"]

for (k in 1:79){
  tb_vxa[age_from == k  & age_thru == k, AgeGrp := as.character(paste0("(", k, ",", k, "]"))]
}

tb_vxa <- tb_vxa[, !c("age_from", "age_thru")]
tb_vxa <- tb_vxa[year >= 2024]
tb_vxa <- tb_vxa[TB != "Rdead" & TB!= "TBdead" & HIV != "HIVdead"]
tb_vxa <- tb_vxa[,.(Number_VXa = sum(value)), by = .(Country = country, Year = year, AgeGrp)]
tb_vxa <- tb_vxa[, Year := floor(Year)]


population <- setDT(output$population)
population <- population[year >= 2024]

population <- population[(year %% 0.5 == 0),] # use the average of the year for the stocks
population <- melt(population, id.vars = c("year", "country"),
                   variable.name = "AgeGrp", value.name = "Population")

population <- population[AgeGrp == "0", AgeGrp := "[0,0]"]
population <- population[AgeGrp == "80", AgeGrp := "(80,89]"]
population <- population[AgeGrp == "90", AgeGrp := "(90,99]"]

for (k in 1:79){
  population[AgeGrp == k, AgeGrp := as.character(paste0("(", k, ",", k, "]"))]
}

# Subset the variables and make sure the capitals are correct
population <- population[, .(Country = country, Year = year, AgeGrp, Population)]
population <- population[, Year := floor(Year)]


tb_vxa <- merge(population, tb_vxa)
tb_vxa_saved=tb_vxa
tb_vxa <- tb_vxa[, Total := cumsum(Number_VXa), by = .(Country, AgeGrp)]
tb_vxa <- tb_vxa[Number_VXa == 0, Total := 0]

tb_vxa$AgeGrp  <- ordered(tb_vxa$AgeGrp,
                          levels = c("(9,9]", "(10,10]", "(11,11]", "(12,12]", "(13,13]",
                                     "(14,14]", "(15,15]", "(16,16]", "(17,17]", "(18,18]", "(19,19]"),
                          labels = c("(9,9]", "(10,10]", "(11,11]", "(12,12]", "(13,13]",
                                     "(14,14]", "(15,15]", "(16,16]", "(17,17]","(18,18]", "(19,19]"))

ggplot(data = tb_vxa[!(is.na(AgeGrp))]) +
  geom_col(aes(x = Year, y = (Number_VXa/Population)*100), width = 1) +
  scale_colour_viridis_d(direction = -1, option = "viridis") +
  scale_fill_viridis_d(direction = -1, option = "viridis") +
  theme_bw() +  theme_minimal_grid() + panel_border(color = "black") +
  geom_hline(yintercept = 80) +
  facet_wrap(~ AgeGrp) + ylim(c(0,NA)) +
  theme(
    legend.text = element_text(size = 14),
    legend.title = element_blank(),
    legend.justification = "right",
    legend.position = "bottom",
    axis.title.x = element_text(hjust = 1, size = 16),
    axis.title.y = element_text(hjust = 1, size = 16),
    axis.text = element_text(size = 12)
  ) +
  labs(y = "Percent of age group receiving a vaccine that year")



