ages=c(0:20,20+5*(1:12),90)
ages=5*(0:15)
ages=c(0:80,90)



cmages=(0:15)*5

row=1:20

Q=matrix(runif(200),10,20)
sel=(1:10)<=5
Q[sel,] = t(matrix(rep(row,5),ncol=sum(sel)))

check.and.index.age.groups(ages)
  
check.and.index.age.groups = function(age.groups=NULL, max.age=75,age.diff=5){

  assert_that(length(unique(age.groups))==length(age.groups),msg="age group limits should be unique")
  age.groups[age.groups>max.age]=max.age
  indices = age.groups %/% age.diff
  diffs   = age.groups[-1]-age.groups[1:(length(age.groups)-1)]
  sel     = diffs==0
  assert_that(all(diffs[!sel]==1 | diffs[!sel]==5),msg="intervals between age.groups should be 1 or 5 years")  
  for (i in 1:length(unique(indices))){
    assert_that(sum(indices[!sel]==unique(indices)[i]) %in% c(1,5),msg="invalid age group definition") 
  }
  indices+1
}

expand.contact.matrix = function(parms, contactM, scale=T){ # performance is not important as this is done once per parameters initialization
  M = matrix(0,parms$nAGES,parms$nAGES)
  rownames(M)=colnames(M)=names(parms$AGES) # i.e. 0,1,....,70,80
  ages = as.integer(substring(colnames(contactM),2)) # e.g. 0, 5, 10, ....
  # check contacts matrix
  assert_that(length(ages)==16 & sum((ages[2:16]-ages[1:15])==5)==15)
  # and model matrix
  one.yr   =  parms$nAGES == 82 && sum(parms$AGES != c(0:80,90))==0
  five.yr  =  parms$nAGES == 16 && sum(parms$AGES != 5*(0:15))==0
  first.yr.single = parms$nAGES == 17 && sum(parms$AGES != c(0,1,5*(1:15)))==0
  
  assert_that(one.yr || five.yr || first.yr.single, msg="choose either standard model age groups c(0:80,90) or 5*(0:15) or c(0,1,5*(1:15))")
  if (one.yr){
    for (i in seq_along(ages)){
      if (i<length(ages)){
        range1  = parms$AGES >= ages[i] & parms$AGES < ages[i+1]
        range1a = NULL
      }else{
        range1  = parms$AGES >= ages[i] & parms$AGES < ages[i]+5 # i.e. 80  
        range1a = parms$AGES >= 80 
      }
      for (j in seq_along(ages)){
        if (j<length(ages)){
          range2 = parms$AGES >= ages[j] & parms$AGES < ages[j+1]
          range2a= NULL
        }else{
          range2 = parms$AGES >= ages[j] & parms$AGES < ages[j]+5 # i.e. 80  
          range2a= parms$AGES >= 80 
        }
        M[range1,range2]=contactM[i,j] / 5.
        if (!is.null(range1a)){
          M[range1a,range2]=contactM[i,j]
        }
        if (!is.null(range2a)){
          M[range1,range2a]=contactM[i,j]
        }
        if (!is.null(range1a) & !is.null(range2a)){
          M[range1a,range2a]=contactM[i,j]
        }
      }
    }
  }else if (five.yr){
    M=contactM
  }else if (first.yr.single){
    M[3:17,3:17]=contactM[2:16,2:16]
    M[1: 2,3:17]=contactM[1   ,2:16]
    M[2:17,1   ]=contactM[1:16,1]*0.2
    M[2:17,2   ]=contactM[1:16,1]*0.8
    M[1   ,1:2 ]=M[2,1:2]
  }
  M  
}
