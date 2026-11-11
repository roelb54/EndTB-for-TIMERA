rm(list=ls())
model = new.env()
# for debugging set model to globalenv():
#model = globalenv()
suppressPackageStartupMessages({
  source(here::here("R","include-v11.R"))
  source(here::here("R","TBVx-run-v1.R"))
  taskenvvar="taskID"
  #library(ggplot2)
  #library(cowplot)
  #theme_set(theme_minimal_grid() + panel_border(color = "black"))
})


paths = set.paths(countries   = "countries", 
                  countrycode = "IND", 
                  xml         = "XMLinput_under.xml", 
                  parameters  = "input_under.csv")

output <- run(paths, write.to.file = T)
Sys.time()
output <- run(paths, sample.parameters = F, write.to.file = F,
              combine.stocks.and.flows = F, output.flows = F)
Sys.time()



testing <- output[["stocks"]]

ggplot(testing[TB == "Dscount" & age_from == 0 & age_thru ==99]) +
  geom_line(aes(x = year - 0.5, y = value*100000, col = RISK))


count_alive <- c("Un", "Lf", "Ls", "L0", "Ds", "Dc", "T", "R")

distrib <- testing[TB %in% count_alive & age_from == 0 & age_thru ==99]

distrib <- distrib[, Total_risk := sum(value), by = c("RISK", "year")]
distrib <- distrib[, Total := sum(value), by = c("year")]
distrib <- distrib[, .(year, RISK, Total_risk, Total)]
distrib <- unique(distrib)
distrib <- distrib[, Prop := (Total_risk/Total)*100]
distrib <- distrib[, BMI := RISK]

ggplot(distrib) +
  geom_line(aes(x = year - 0.5, y = Prop, col = BMI)) +
  ylim(c(0,100)) + xlab("Year") + ylab("Percent")

