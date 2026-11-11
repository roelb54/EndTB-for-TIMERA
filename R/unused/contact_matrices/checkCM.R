library(socialmixr)
data(polymod)
cm=contact_matrix(polymod,countries="Netherlands",age.limits=5*(0:15),symmetric=T)#return.demography = T)

M = cm$matrix
pop = cm$demography$population

M * pop

# test my method ....

cm2=contact_matrix(polymod,countries="Netherlands",age.limits=5*(0:15),return.demography = T)
Z = cm2$matrix
ZtZ = Z + t(Z)
pop = cm2$demography$population
P = matrix(pop,16,16)
PtP = P + t(P)
X = t(ZtZ * pop) / PtP
X * pop
# lijkt OK maar hoe testen in TBvax ???
