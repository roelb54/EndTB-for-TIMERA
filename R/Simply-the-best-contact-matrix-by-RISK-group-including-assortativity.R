C   = read.contact.matrix("countries/BRA/data/BRA_all_contacts_2021.txt")
popcomm  = read.csv("countries/BRA/data/popcomm.csv",row.names = 1)
popexprs = read.csv("countries/BRA/data/popexprs.csv",row.names = 1)

# first balance Cm:
popall = colSums(popcomm)+colSums(popexprs)
Cm = (C*popall+t(C*popall))/2/popall
isSymmetric(Cm*popall)
# OK ; symmetric
# check rowSums and total
rowSums(Cm*popall)
sum(rowSums(Cm*popall))

# now extend to 32 x 32 matrix to be multiplied with poplong
# i.e. 16 comm first, followed by 16 exprs
n = 16
poplong=c(colSums(popcomm),colSums(popexprs))
FM = EM = DM = CM   = matrix(0,32,32)
# of eenvoudiger
q = poplong/rep(colSums(popcomm)+colSums(popexprs),2)
# i.e. q is a vector of the size of each risk groups as a fraction of total 
DM[1:n,1:(2*n)]     = t(q*t(matrix(Cm,nrow=n,ncol=2*n)))
DM[n+(1:n),1:(2*n)] = t(q*t(matrix(Cm,nrow=n,ncol=2*n)))

round(DM * poplong)
isSymmetric(DM * poplong)
DMok = (DM * poplong + t(DM*poplong))/2/poplong
isSymmetric(DMok * poplong)
rowSums(DMok * poplong)
sum(rowSums(DMok * poplong))

# ALL ABOVE SHOULD BE OKAY  !!!! 
# NOW: construct matrix with 100% homophily i.e. assortativity

# start with original balanced contact matrix and put that in the new matrix upper left and lower right
EM[1:n,1:n]=Cm
EM[(1+n):(2*n),(1+n):(2*n)]=Cm

EMok = (EM * poplong +t(EM*poplong))/2/poplong
isSymmetric(EMok*poplong)

rowSums(EMok * poplong)
sum(rowSums(EMok * poplong))

# OK !!!so far so good ; now we have 
# DMok * poplong with prop mixing and
# EMok * poplong with 100% assortative mixing
# for something in between: just take the weighted average :-) 

h = 0 # vary h between 0 (proportional) and 1 (100% assortativity)
FM = (1-h)*DMok + h*EMok
isSymmetric(FM * poplong)
FM * poplong
upperright=(FM*poplong)[1:n,n+(1:n)] 
lowerleft =(FM*poplong)[n+(1:n),1:n] 
rowSums(upperright)
sum(colSums(upperright))
rowSums(lowerleft)
sum(colSums(lowerleft))

upperleft=(FM*poplong)[1:n,1:n] 
lowerright =(FM*poplong)[n+(1:n),n+(1:n)] 
rowSums(upperleft)
sum(colSums(upperleft))
rowSums(lowerright)
sum(colSums(lowerright))
