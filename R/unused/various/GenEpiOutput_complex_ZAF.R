#-------------------
# GenEpiOutput.R
# Generate the epi output for the thinned paramset
# Last updated 7 September 2021
#-------------------

# 1. Set-up
suppressPackageStartupMessages({
  rm(list=ls())
  model = globalenv()
  library(here)
  library(data.table)
  library(renv)
  library(digest)
  library(log4r)
  library(fst)
  library(git2r)
  library(arrow)
  if (!require("getopt")) install.packages("getopt")
  library(getopt)
  library(logger)
  taskenvvar="taskID"
  source(here("R","include-v11.R"), model)
  source(here("R", "workflow", "run_param_set_epi_count.R"))
  source(here::here("R","TBVx-run-v1.R"), model)
})


# 2. Load in the country code and set the name of the csv with the vx_scenarios
if (T){ # on local machine
  grid_task_int <- 1
  cc <- "ZAF"
  vx_scenarios <- "epi_vx_scenarios_bmgf_all_test.csv" #vx_scenarios_test.csv

  } else{ # on cluster
    opts = getopt(matrix(c('cc','c', 1, "character",
                           'scenario', 's', 1, "character"),
                         byrow=TRUE, ncol=4))
    
    grid_task_int     <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))
    cc <- opts$cc
    vx_scenarios <- opts$scenario
  
}


# Load in the fitted parameters for the country
parameters <- fread(here("./processing_files/paramsets/", paste0(cc, "_params.csv")))
parameters <- as.data.table(parameters)
parameters <- parameters[grid_task_int:grid_task_int, ]

# Read in the csv with the different vx_scenarios to run 
vx_scenarios <- fread(here("./processing_files/", vx_scenarios))


# 3. Make Directories

if(!dir.exists(here("epi_output"))) dir.create(here("epi_output"), showWarnings = F)
if(!dir.exists(here("epi_output/n_epi"))) dir.create(here("epi_output/n_epi"), showWarnings = F)


# j=1
# 4. Generate the output and write out 
for (j in 1:nrow(parameters)){#

  print(paste0("start time = ", Sys.time()))
  
  print(paste0("starting parameter set number ", j))
  
  # select row j of parameters
  params <- parameters[j, ]
  
  # save the uid
  params_uid <- params[, uid]
  
  print(paste0("uid = ", params_uid))

  # Get rid of everything except parameters
  params <- params[, !c("uid", "n_hit")]
  params <- unlist(params)
  
  
  # Run through all the vaccine scenarios for each parameter set
  cc_n_epi_param <- list()
  
  for (i in 1:2){#nrow(vx_scenarios)){
    
    # subset to the i-th row of characteristics
    vx_chars <- vx_scenarios[i,]
    
    print(paste0("vaccine scenario number ", i))
    
   
    # run the model with the row of parameters
    vx_scen_output <- run_param_set_epi(model, cc, params, params_uid, vx_chars)
    
    cc_n_epi_param[[i]]  <- vx_scen_output[["n_epi"]]
    
    }
  
  
  write_parquet(rbindlist(cc_n_epi_param), here("epi_output", "n_epi", paste0(params_uid, ".parquet")))
  #rm(cc_n_epi_param)
  #gc(full= TRUE)
  
  print(paste0("end time for parameter set ", j, " = ", Sys.time()))
  
  
}


# pq=read_parquet(here("epi_output", "n_epi", "bc72f4c2b4fd16c553f4cfea722f8b11.parquet"))
# View(pq)

# ---- end









