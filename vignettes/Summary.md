This document is a user's guide for the **tbvax** model and contains the following sections:
* Introduction  
  _Definition of the **tbvax** model and its purpose_
* **tbvax**: a system of differential equations  
  _More details about **tbvax** as a system of differential equations and about using matrix multiplications to calculate the derivatives (using a basic SIR model as an example)_
* Demography  
  _Details about data used for the population composition, births and deaths, and about adjusting the population composition over time_
* Model Specification in XML  
  _Details about specifying **tbvax** models in XML: first a simple SIR model, then a more complex ZAF model and finally how to specify multiple vaccines_
* Output and evaluation of targets  
  _Details about the **stocks**, **flows** and **hits** output and about the specification of targets to be evaluated in a so-called targets file. In addition, R functions related to target evaluation are documented_
* Econ output  
  _A description of the various output files that are generated when econ.output="true" in the XML, for both baseline and intervention_
* Optimization  
  _Details about optimization and how to call the run.optimization() R function_
* R version and libraries  
  _The version of R and the R packages used in the current model version (3.1.4)_  
  
  
A separate programmer's guide is in preparation. The programmer's guide will describe the R functions used in tbvax.  