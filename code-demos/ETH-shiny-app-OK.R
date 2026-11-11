rm(list=ls())
library(shiny)
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"
seed=60
set.seed(seed)
Sys.setenv(taskID=seed^2)

paths = set.paths(countries   = "countries", 
                  countrycode = "ETH", 
                  xml         = "TPT/ETH_47hits_TPT_base_4.xml",
                  parameters  = "TPT/inputshinyE.csv",
                  targets      = "TPT/ETH_targetPLOTno19inci099.csv")

df_base = run(paths, write.to.file = F)$hits
yrs = (2000+(0:7)*5)+0.5
sel = (df_base$year %in% yrs
       & df_base$name == "TB_inci_0_99" 
       & df_base$age_from==0
       & df_base$age_thru==99)

baseinci = df_base$model[sel] 
names(baseinci) = as.character(trunc(yrs))


server = shinyServer(function(input, output) {
  
output$eta2doc <- renderText(    
{"additional treatment rate (of Dc): the
fraction of the population with active TB
treated per year in addition to the baseline
rate of 0.68/yr"})

output$alphaTPTdoc <- renderText(
{"TPT rate: the fraction treated with TPT 
of IGRA+ household members of a treated 
Dc case"})

output$iotadoc <- renderText(     
{"TPT (and Ds/Dc) treatment rate in the 
general population: the fraction tested 
and treated per year"})
  
  inci2 = eventReactive(input$go,{
    pp = as.numeric(c(input$eta2,input$alphaTPT,input$iota))#, input$effTPT, input$pRTPT))
    names(pp)=c("eta2","alphaTPT","iota")#,"effTPT","pRTPT")
    df_intv = run(paths, new.parameter.values = pp, write.to.file = F)$hits
    # yrs = (2000+(0:7)*5)+0.5
    sel = (df_intv$year %in% yrs & df_intv$name == "TB_inci_0_99" & df_intv$age_from==0 & df_intv$age_thru==99)
    df_intv$model[sel] 
  })
  
  output$rev <- renderPlot({
    inci3 = as.numeric(inci2())
    names(inci3) = as.character(trunc(yrs))
    
    barplot(baseinci,col="palegreen",
            main=paste("TB incidence in",input$country," in 2035:",round(inci3["2035"],0),"/100,000"),
            ylab="# new cases / 100,000",
            xlab="year")
    barplot(inci3,col="green",add=T)
  })
})

ui = shinyUI(pageWithSidebar(
  
  headerPanel(title = span("Impact of TPT on TB incidence in Ethiopia [v0.9 Nov 2026]")), 
  #style = "color: black; font-size: 20px")),
  
  sidebarPanel(
    p("Original ETH model specification by Rebecca Clark, LSHTM (The Lancet Global Health 11 (4), e546)"),
    p("TPT specification, model implementation and web application by Roel Bakker, LSHTM, KNCV"),
    # selectInput('country', 'Country', c("ZAF","ANG","IND")),
    # sliderInput('end_year',  "End year:", min = 2016, max = 2030, value = 2020, step= 1),
    sliderInput('eta2', "additional treatment rate\n (of Dc cases):", min = 0, max = 1, value = 0, step= 0.1),
    verbatimTextOutput("eta2doc"),
    sliderInput('alphaTPT', "TPT rate for household members\n of Dc cases:", min = 0, max = 1.5, value = 0, step= 0.1),
    verbatimTextOutput("alphaTPTdoc"),
    sliderInput('iota', "TPT rate for general population:", min = 0, max = 0.5, value = 0, step= 0.1),
    verbatimTextOutput("iotadoc"),
    #numericInput("effTPT", "TPT effectiveness:", 0.7, min = 0, max = 1, step=0.05, width="200px"),
    #numericInput("pRTPT", "protection against reinfection after TPT:", 0.62, min = 0, max = 1, step="0.02", width="200px"),
    actionButton("go","Go")
  ),
  mainPanel(
    plotOutput("rev",height = "600px")
  )
))
shinyApp(ui,server)

