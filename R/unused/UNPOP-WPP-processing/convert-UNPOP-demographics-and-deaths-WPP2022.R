rm(list=ls())
library(data.table)
source("./R/TBVx-age-related-fncs-v14.R")

# convert UNPOP deathrates
a = read.csv("./R/UNPOP-WPP-processing/UNPOP/WPP2022_Life_Table_Complete_Medium_Both_1950-2021.csv",header=T,stringsAsFactors = F, fileEncoding = 'UTF-8-BOM')
b = read.csv("./R/UNPOP-WPP-processing/UNPOP/WPP2022_Life_Table_Complete_Medium_Both_2022-2100.csv",header=T,stringsAsFactors = F, fileEncoding = 'UTF-8-BOM')
x = rbind(a,b)
y = x[x$Sex=="Total",c("LocID","MidPeriod","AgeGrpStart","mx")]
cc = read.csv("./R/UNPOP-WPP-processing/UNPOP/wikipedia-iso-country-codes.csv")
names(cc)[4] = "LocID"
z = merge(y,cc,by="LocID")
z=z[,c(7,2,3,4)]
names(z)=c("country","year","age_from","value")
setDT(z)
df=dcast(z, country + year ~ age_from, value.var = "value")
o = order(df$country,df$year)
df=df[o,]
write.csv(df,file="./R/UNPOP-WPP-processing/UNPOP/WPP2022-deathrate-all-1950-thru-2100.csv",row.names = F, quote=F)

# convert UNPOP demographics data
y = read.csv("./R/UNPOP-WPP-processing/UNPOP/WPP2022_Population1JanuaryBySingleAgeSex_Medium_1950-2021.csv")
z = read.csv("./R/UNPOP-WPP-processing/UNPOP/WPP2022_Population1JanuaryBySingleAgeSex_Medium_2022-2100.csv")
x = rbind(z,y)
cc = read.csv("./R/UNPOP-WPP-processing/UNPOP/wikipedia-iso-country-codes.csv")
names(cc)[4] = "LocID"
a = merge(x,cc,by="LocID")
b = a[,c("ISO3_code","MidPeriod","AgeGrpStart","PopTotal")]
sel = abs(a$AgeGrpSpan) != 1 ; a[sel,]
names(b)=c("country","year","age_from","n")
o = order(b$country,b$year,b$age_from)
c = b[o,]
write.csv(c,file="./R/UNPOP-WPP-processing/UNPOP/WP2022-demographics-all-countries.csv",row.names = F, quote=F)

d = as.data.table(c)
names(d)
df=dcast(d, country + year ~ age_from, value.var = "n")
write.csv(df,file="./R/UNPOP-WPP-processing/UNPOP/WPP2022-demographics-all-1950-2100.csv",row.names = F, quote=F)


