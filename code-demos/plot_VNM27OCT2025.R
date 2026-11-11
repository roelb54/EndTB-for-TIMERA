 # use output from run with 231 hits i.e. from run_VNM27JUNLATE.R ; also in 29JUN13h58_231of239.xml


z = output$hits
View(z)

# Plot 1. Incidence all 

sel_inci = z$xTB == "Ds" & z$xtype=="inflow" & z$age_from==0 & z$age_thru==99
inci = z[sel_inci,]
x=inci$year
y=inci$value
ylo=inci$lo
yhi=inci$hi
mdl=inci$model
plot(x,y,type="l",col="blue",xlab="year",ylab="TB incidence [1/(100,000 personyr)]",lwd=2, ylim=c(0,750))
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")


# Plot 2. Notifications male 

sel_notif_male = z$xSES == "male" & z$xTB == "T" & z$xtype=="inflow" & z$age_from==0 & z$age_thru==99 & z$year %in% ((1996:2015)+0.5)
notif_male = z[sel_notif_male,]

x=notif_male$year
y=notif_male$value
ylo=notif_male$lo
yhi=notif_male$hi
mdl=notif_male$model
plot(x,y,type="l",col="blue",xlab="year",ylab="TB notifications in males [1/(100,000 personyr)]",lwd=2, ylim=c(0,300))
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")

# Plot 3. Notifications female 

sel_notif_female = z$xSES == "female" & z$xTB == "T" & z$xtype=="inflow" & z$age_from==0 & z$age_thru==99 & z$year %in% ((1996:2015)+0.5)
notif_female = z[sel_notif_female,]

x=notif_female$year
y=notif_female$value
ylo=notif_female$lo
yhi=notif_female$hi
mdl=notif_female$model
plot(x,y,type="l",col="blue",xlab="year",ylab="TB notifications in females [1/(100,000 personyr)]",lwd=2, ylim=c(0,300))
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")

# Plot 4. TB deaths 

sel_tbdeaths = z$xTB == "TBdead" & z$xtype=="inflow" & z$age_from==0 & z$age_thru==99
tbdeaths = z[sel_tbdeaths,]

x=tbdeaths$year
y=tbdeaths$value
ylo=tbdeaths$lo
yhi=tbdeaths$hi
mdl=tbdeaths$model
plot(x,y,type="l",col="blue",xlab="year",ylab="TB deaths [1/(100,000 personyr)]",lwd=2, ylim=c(0,100))
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")

# Plot 5. TB prevalence 2007 by age group 

sel_tbprev2007 = z$year==2007.5 & z$xSES=="all" & z$xTB == "Ds, Dc" & z$xtype=="stock" & z$age_from %in% (15+10*(0:5)) & !(z$age_from==15 & z$age_thru==99) 
tbprev = z[sel_tbprev2007,]

x=tbprev$age_from
y=tbprev$value
ylo=tbprev$lo
yhi=tbprev$hi
mdl=tbprev$model
plot(x,y,type="l",col="blue",xlab="lower limit of age group",ylab="2007 TB prevalence by age group [1/(100,000 persons)]",lwd=2, ylim=c(0,1000))
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")

# Plot 6. TB prevalence 2018 in females by age group 

sel_tbprev2018 = z$year==2018.5 & z$xSES=="female" & z$xTB == "Ds, Dc" & z$xtype=="stock" & z$age_from %in% (15+10*(0:5)) & !(z$age_from==15 & z$age_thru==99) 
tbprev = z[sel_tbprev2018,]
x=tbprev$age_from
y=tbprev$value
ylo=tbprev$lo
yhi=tbprev$hi
mdl=tbprev$model
plot(x,y,type="l",col="blue",xlab="lower limit of age group",ylab="TB prevalence [1/(100,000 persons)]",lwd=2, ylim=c(0,1200), 
     main="2018 TB prevalence in females by age group")
? plot
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")

# Plot 7. TB prevalence 2018 in males by age group 

sel_tbprev2018 = z$year==2018.5 & z$xSES=="male" & z$xTB == "Ds, Dc" & z$xtype=="stock" & z$age_from %in% (15+10*(0:5)) & !(z$age_from==15 & z$age_thru==99) 
tbprev = z[sel_tbprev2018,]
x=tbprev$age_from
y=tbprev$value
ylo=tbprev$lo
yhi=tbprev$hi
mdl=tbprev$model
plot(x,y,type="l",col="blue",xlab="lower limit of age group",ylab="TB prevalence [1/(100,000 persons)]",lwd=2, ylim=c(0,1200),
     main="2018 TB prevalence in males by age group")
lines(x,ylo,type="l",col="blue",lwd=1)
lines(x,yhi,type="l",col="blue",lwd=1)
points(x,mdl,type="p",col="red",pch="x")

# Plot 8. TB notifications in males by age group  

sel_tbnotifs_male_2016_2023 = z$year %in% ((2016:2023)+0.5) & z$xSES=="male" & z$xTB == "T" & z$xtype=="inflow" 
notifsMbyage = z[sel_tbnotifs_male_2016_2023,]

x=unique(notifsMbyage$year)
agelow = notifsMbyage$age_from==0
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model

plot(x,y,type="l",col="blue",xlab="year",ylab="TB notifications [1/(100,000 personyr)]",lwd=2, ylim=c(0,600),
     main="2016 thru 2023 TB notifications in males by age group")
points(x,mdl,type="p",col="blue",pch="x")

agelow = notifsMbyage$age_from==15
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="green",xlab="year",lwd=2)
points(x,mdl,type="p",col="green",pch="x")


agelow = notifsMbyage$age_from==25
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="purple",xlab="year",lwd=2)
points(x,mdl,type="p",col="purple",pch="x")

agelow = notifsMbyage$age_from==35
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="pink",xlab="year",lwd=2)
points(x,mdl,type="p",col="pink",pch="x")

agelow = notifsMbyage$age_from==45
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="red",xlab="year",lwd=2)
points(x,mdl,type="p",col="red",pch="x")

agelow = notifsMbyage$age_from==55
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="darkred",xlab="year",lwd=2)
points(x,mdl,type="p",col="darkred",pch="x")

agelow = notifsMbyage$age_from==65
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="black",xlab="year",lwd=2)
points(x,mdl,type="p",col="black",pch="x")

legend("topright", 
       legend=c("0-14", "15-24", "25-34","35-44","45-54","55-64","65-99"),
       col=c("blue", "green", "purple", "pink", "red", "darkred","black"),
       lty=1:2, cex=0.7,  # Added lty for lines and adjusted cex for size
       pch="x")

# Plot 9. TB notifications in females by age group  

sel_tbnotifs_female_2016_2023 = z$year %in% ((2016:2023)+0.5) & z$xSES=="female" & z$xTB == "T" & z$xtype=="inflow" 
notifsMbyage = z[sel_tbnotifs_female_2016_2023,]

x=unique(notifsMbyage$year)
agelow = notifsMbyage$age_from==0
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model

plot(x,y,type="l",col="blue",xlab="year",ylab="TB notifications [1/(100,000 personyr)]",lwd=2, ylim=c(0,200),
     main="2016 thru 2023 TB notifications in females by age group")
points(x,mdl,type="p",col="blue",pch="x")

agelow = notifsMbyage$age_from==15
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="green",xlab="year",lwd=2)
points(x,mdl,type="p",col="green",pch="x")


agelow = notifsMbyage$age_from==25
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="purple",xlab="year",lwd=2)
points(x,mdl,type="p",col="purple",pch="x")

agelow = notifsMbyage$age_from==35
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="pink",xlab="year",lwd=2)
points(x,mdl,type="p",col="pink",pch="x")

agelow = notifsMbyage$age_from==45
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="red",xlab="year",lwd=2)
points(x,mdl,type="p",col="red",pch="x")

agelow = notifsMbyage$age_from==55
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="darkred",xlab="year",lwd=2)
points(x,mdl,type="p",col="darkred",pch="x")

agelow = notifsMbyage$age_from==65
y=notifsMbyage[agelow,]$value
mdl=notifsMbyage[agelow,]$model
lines(x,y,type="l",col="black",xlab="year",lwd=2)
points(x,mdl,type="p",col="black",pch="x")

legend("topright", 
       legend=c("0-14", "15-24", "25-34","35-44","45-54","55-64","65-99"),
       col=c("blue", "green", "purple", "pink", "red", "darkred","black"),
       lty=1:2, cex=0.7,  # Added lty for lines and adjusted cex for size
       pch="x")

