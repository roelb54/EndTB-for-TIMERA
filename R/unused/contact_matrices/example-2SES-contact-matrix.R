cM = matrix(c(10,2,3,8),2,2)
A = matrix(0,4,4)
A[1:2,1:2]=0.9*cM
A[1:2,3:4]=0.1*cM
A[3:4,1:2]=0.1*cM
A[3:4,3:4]=0.9*cM
pop = c(100,120,0.8*100,0.8*120)
n = length(pop)
P = matrix(pop,n,n)



# Checked. The number of contacts between A1 and A2 should be equal to the number of contact between A2 and A1
# The contact matrix is adjusted to ensure that. The average number of contacts should remain roughly the same for not too large diffs in group size
AplustA = A + t(A)
M = as.matrix(t(AplustA  *  pop) / (P+t(P)))
M * pop
# NOTE: thought the t(parms$contacts$MplustM  *  alive.pop) may seem incorrect it is definitely correct 
# in the foi function the foi calculation includes M %*% i_ (with i_ the fraction infectious)
# and later the multiplication with susc (i.e. numbers resulting from matrix multiplication of transition matrix and pop (Y))
# means that all works correctly.
# check with  
M[is.nan(M)]=0
require(assertthat)
assert_that(isSymmetric(M * pop),msg="adjusted contacts matrix multiplied with pop should be symmetric")
# assert_that(sum(is.nan(M))<1,msg="too many NaN in adjusted contacts matrix")
M
