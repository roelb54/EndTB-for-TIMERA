x=1959:2030
sh=0.3
midx=2018
y=1/(1+exp(-sh*(x-midx)))
plot(x,y)
round(y,2)
