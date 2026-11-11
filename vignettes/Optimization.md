# Optimization

#  Overview

Here, we briefly describe and document optimization in the TB Vx model.

* the Levenberg-Marquardt algorithm from the R package minpack.lm (version 1.2-1) is used for optimization
* the algorithm attempts to minimize the sum of weighted squared residuals between targets and model outputs

This algorithm was tested with the IND XML input file (XMLinput.xml), the parameters file (input572F.csv) and targets file (RC_IND_targets_RBv7minx.csv) [all in tbvax - current - /countries-temp/IND/parameters ].

For some parameters, minimum and maximum of the ranges were slightly modified to prevent the model getting 'stuck in a corner'.
Some of the target errors were modified to increase the importance of some of the targets (in an attempt to reduce the relapse rate) and to reduce the importance of others.

We had excellent results with this method: of 40 optimization runs 34 had hit at least 50 out of 81 targets.
Attempts with other optimization methods (Nelder-Mead, conjugate gradient) were not successful, usually because the optimizer got stuck at minima or maxima of parameter values. 

It would be worthwhile to explore optim() further, especially the Nelder Mead and CG methods, with proper values of control$parscale.

We did not (yet) include a penalty in the sum of weighted squared residuals to steer the optimizer away from minima and maxima of parameter ranges. 

#  Code

## run.optimization()
The function **run.optimization(model=NULL, lmcontrol, nruns=1)** [in TBVx-optimization-fncs-v#.R] takes as **_arguments_**:
* **model**: the model environment of which model$paths should have been initialized with model$set.paths()
* **lmcontrol**: name of a .csv file with parameters for the Levenberg-Marquardt algorithm 

  this file sets the arguments **ftol**, **diag**, **epsfcn**, and **maxiter** of the function **nls.lm.control()** 

  [see the documentation of nls.lm.control() in the R package minpack.lm]

  Note: in the run.optimization() code the argument **diag** is divided by a vector with the means of the values of the fitted parameters 
        a large value of diag will lead to 'wilder' behaviour of the optimizer (jumping around in parameter space more extremely)

* **nruns**: the number of optimization runs

and **_returns_**: nothing

Each optimization run produces the following files:
* the **optimization log**: a file in the country folder ending in [optim].log e.g. IND/logs/[IND][125][2021-06-03_21h45m37s][][3_0_4][XMLinput][optim].log
* the **model log**: e.g. IND/logs/2021-06-03-2145_LOCAL_IND_model.log
* an **XML input file** with parameter values of best fit: e.g. IND/logs/[IND][125][2021-06-03_22h17m14s][e8cba61a48b81482d3dd14c90741947e][3_0_4][XMLinput][1][79][optim].xml
* a **comparison between targets and model output** for the best fit: e.g. IND/logs/[IND][125][2021-06-03_22h17m14s][e8cba61a48b81482d3dd14c90741947e][3_0_4][XMLinput][1][79].[optim].txt
* a **file with optimal parameter values**: e.g. IND/logs/[IND][125][2021-06-03_22h17m14s][e8cba61a48b81482d3dd14c90741947e][3_0_4][XMLinput][1][79][optim]_params.csv
