plot_with_error_bars = function(z, name=".*",ylab="",main="" ){
  sel = grep(name,z$name)
  plot(z[sel,]$year, z[sel,]$value,
       ylim=range(c(0,z[sel,]$hi)),
       pch=19, xlab="year", ylab=ylab,
       main=main)
  arrows(z[sel,]$year, z[sel,]$lo, z[sel,]$year, z[sel,]$hi, length=0.05, angle=90, code=3)
  lines(z[sel,]$year,z[sel,]$model,type="l",lwd=3,col="red")
}

z = read.delim(file="countries/NAM/output/[NAM][2024-02-27_15h20m54s][21f19ede094f61971512ff746ba664a3][3_5_1][NAM66of71_EndTB][hits].txt")

plot_with_error_bars(z, name="TB_inci_0_99",ylab="new cases / 100K",main="TB incidence [0-99]" )
plot_with_error_bars(z, name="TB_notif_0_99",ylab="notifications / 100K",main="TB notifications [0-99]" )
plot_with_error_bars(z, name="TB_deaths_noHIV_0_99",ylab="TB deaths (HIV neg) / 100K",main="TB deaths (HIV-) [0-99]" )
plot_with_error_bars(z, name="TBHIV_morthiv_0_99",ylab="TB deaths (HIV pos) / 100K",main="TB deaths (HIV+) [0-99]" )
plot_with_error_bars(z, name="HIV_prev_0_14_pct",ylab="HIV prevalence [%] 0-14",main="HIV prevalence [0-14]")
plot_with_error_bars(z, name="HIV_prev_15_99_pct",ylab="HIV prevalence [%] 15-99",main="HIV prevalence [15-99]" )
plot_with_error_bars(z, name="HIV_prev_15_49_pct",ylab="HIV prevalence [%] 15-99",main="HIV prevalence [15-99]" )
plot_with_error_bars(z, name="HIV_artcov_0_14_pct",ylab="ART coverage [%] 0-14",main="ART coverage [0-14]")
plot_with_error_bars(z, name="HIV_artcov_15_99_pct",ylab="ART coverage [%] 15-99",main="ART coverage [15-99]" )

