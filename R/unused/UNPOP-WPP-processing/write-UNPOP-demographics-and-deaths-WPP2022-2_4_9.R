rm(list=ls())
source("./R/TBVx-age-related-fncs-v14.R")

compose.and.write.deathrate.or.pop.for.all.countries=function(data.all=NULL,path=NULL,addcountryISO3=F,outfname=NULL){
  dir.create(path)
  countries = unique(data.all$country)
  for (country in countries){
    bb=data.all[data.all$country==country,]
    rownames(bb)=bb[,2]
    cc=bb[,-c(1,2)]
    colnames(cc) = as.integer(substr(colnames(cc),2,4))
    mm=as.matrix(cc)
    y = adjust.age.groups(p=NULL,M=mm,F,F,F) # don't aggregate to produce the same format as demography files
    flist=apply(y,2,approxfun,x=as.integer(rownames(y)),rule=2)
    years = 1950:2100
    z  = lapply(flist,function(x) x(years))
    zz=matrix(unlist(z),length(years),100)
    rownames(zz)=years
    colnames(zz)=0:99
    df=as.data.frame(zz)
    df=cbind(country=rep(country,length(years)),year=years,df)
    if (addcountryISO3){
      dir.create(path = paste0(path,country))
      write.table(df,file=paste0(path,country,"/",country,outfname),row.names = F, quote=F, sep=",",dec=".",col.names=F)
    }else{
      dir.create(path = paste0(path,country))
      write.table(df,file=paste0(path,country,"/",outfname),row.names = F, quote=F, sep=",",dec=".",col.names=F)
    }
  }
}

deaths=read.csv(file="./R/UNPOP-WPP-processing/UNPOP/WPP2022-deathrate-all-1950-thru-2100.csv",header=T, stringsAsFactors = F, fileEncoding = 'UTF-8-BOM')
compose.and.write.deathrate.or.pop.for.all.countries(data.all=deaths,path="./UNPOP-deathrates/",addcountryISO3=T,outfname="_deathrates.csv")

pop=read.csv(file="./R/UNPOP-WPP-processing/UNPOP/WPP2022-demographics-all-1950-2100.csv",header=T, stringsAsFactors = F, fileEncoding = 'UTF-8-BOM')
compose.and.write.deathrate.or.pop.for.all.countries(data.all=pop,path="./UNPOP-demography/",addcountryISO3=F,outfname="demographics.csv")

