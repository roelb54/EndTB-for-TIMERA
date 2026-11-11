pop = c(4859,5119)
n = length(pop)
A = matrix(pop,n,n)
M = matrix(c(1.75,1.5,1.35,5.0),2,2)
MplustM=M+t(M)
# Checked. The number of contacts between A1 and A2 should be equal to the number of contact between A2 and A1
# The contact matrix is adjusted to ensure that. The average number of contacts should remain roughly the same for not too large diffs in group size
Z=as.matrix(t(MplustM  *  pop) / (A+t(A)))
Z*pop

# OK so far so good

pop1 = c(0.4*4859,0.3*5119)
n1 = length(pop1)
A1 = matrix(pop1,n1,n1)

pop2 = c(0.6*4859,0.7*5119)
n2 = length(pop2)
A2 = matrix(pop2,n2,n2)

M = matrix(c(1.75,1.5,1.35,5.0),2,2)
MplustM=M+t(M)
# Checked. The number of contacts between A1 and A2 should be equal to the number of contact between A2 and A1
# The contact matrix is adjusted to ensure that. The average number of contacts should remain roughly the same for not too large diffs in group size
Z=as.matrix(t(MplustM  *  pop1) / (A1+t(A1)))
Y=as.matrix(t(MplustM  *  pop2) / (A2+t(A2)))


0.9*Z*pop1+0.1*Y*pop2
0.9*Y*pop2+0.1*Z*pop1

0.9*Z*pop1+0.1*Y*pop2 + 0.9*Y*pop2+0.1*Z*pop1

