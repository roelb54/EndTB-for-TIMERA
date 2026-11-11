rm(list=ls())
library(shiny)
# model = new.env()
# for debugging set model to globalenv():
# model = globalenv()
source(here::here("R","include-v11.R"))
source(here::here("R","TBVx-run-v1.R"))
taskenvvar="taskID"
seed=60
set.seed(seed)
Sys.setenv(taskID=seed^2)
paths = set.paths(countries   = "countries", 
                  countrycode = "VNM", 
                  xml         = "/218of229/VNM2025NOV11_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optim_SHINY.xml",
                  #xml         = "/218of229/VNM_2025-10-27_00h36m54s_2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optim.xml",
                  #xml         = "/214of229/[VNM][2025-10-26_23h42m54s_2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass1_1_92_optim_pEt1_sage3_213of229optim.xml",
                  #parameters  = "/26OCT2025/2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optimj4A25.csv",
                  #parameters  = "/214of229/[VNM][2025-10-26_23h42m54s_2025-10-26_VNM_XMLinput_C_SES_for_gender_v3_A_NEW_vDoptim231ass22_1_92_optim_pEt1_sage3_213of229optim_params.csv",
                  #targets     = "/26OCT2025/VNM2025-06-08_14h08m59s_239targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexDminHai.csv",
                  targets     = "/218of229/VNM2025NOV11targets_MOD_vA_ORIGINAL_and_OK_2018prevbysexDminHai_SHINY.csv",
                  lglevel     = "INFO")
output=run(paths,write.to.file = T)
sum(output$hits$fit)

#model$paths = model$set.paths(countries   = "countries", 
#                              countrycode = "ZAF", 
#                              xml         = "XMLshinyF.xml",
#                              #xml         = "XML_alphaTPT09_eta209_iota0.xml",
#                              parameters  = "inputshinyE.csv",
#                              targets     = "targetPLOTno19inci099.csv")

df_base = run(paths,write.xml="testVNM_A.xml")$hits
yrs = (2000+(0:7)*5)+0.5

sel = (df_base$year %in% yrs
       & df_base$name == "TB_inci_0_99" 
       & df_base$age_from==0
       & df_base$age_thru==99)

baseinci = df_base$model[sel] 
names(baseinci) = as.character(trunc(yrs))

if (F){
 eta2=0.3 ; alphaTPT=0.4 ; iota=0.05 ; effTPT=0.7 ; pRTPT=0.62
 pp = as.numeric(c(eta2,alphaTPT,iota,effTPT,pRTPT))
 names(pp)=c("eta2","alphaTPT","iota","effTPT","pRTPT")
 df_intv = run(model, new.parameter.values = pp, write.to.file = F)$hits
 sel = (df_intv$year %in% yrs & df_intv$name == "TB_inci_0_99" & df_intv$age_from==0 & df_intv$age_thru==99)
 df_intv$model[sel] 
}

server = shinyServer(function(input, output) {
  
  output$eta2doc <- renderText(    
{"additional treatment rate: the fraction of the population
with active TB treated per year in addition to the baseline
rate of 0.63/yr"})
  output$alphaTPTdoc <- renderText(
{"TPT rate: the fraction of PLHIV tested and treated per year;
in addition 2.5 HIV- household members are tested and
treated; at 9% HIV prevalence and a TPT rate of 1.0 this is
3.5*9% = 31.5% of the population"})
  output$TPTdoc <- renderText(     
{"TPT rate in the general population: the (random) fraction
tested and treated per year"})
  
  inci2 = eventReactive(input$go,{
    pp = as.numeric(c(input$eta2,input$alphaTPT,input$iota, input$effTPT, input$pRTPT))
    names(pp)=c("eta2","alphaTPT","iota","effTPT","pRTPT")
    df_intv = run(model, new.parameter.values = pp, write.to.file = F)$hits
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
  
  headerPanel(title = span("Simulated impact of TB interventions for Namibia [v 0.31]")), 
                      #style = "color: black; font-size: 20px")),

  sidebarPanel(
    p("VNM model specification by Roel Bakker, KNCV Tuberculosis Foundation"),
    p("model implementation and web application by Roel Bakker, LSHTM, KNCV"),
    # selectInput('country', 'Country', c("ZAF","ANG","IND")),
    # sliderInput('end_year',  "End year:", min = 2016, max = 2030, value = 2020, step= 1),
    sliderInput('eta2', "additional treatment rate:", min = 0, max = 1, value = 0, step= 0.1),
    verbatimTextOutput("eta2doc"),
    sliderInput('alphaTPT', "TPT rate for PLHIV and household members:", min = 0, max = 1.5, value = 0, step= 0.1),
    verbatimTextOutput("alphaTPTdoc"),
    sliderInput('iota', "TPT rate for general population:", min = 0, max = 0.2, value = 0, step= 0.05),
    verbatimTextOutput("TPTdoc"),
    numericInput("effTPT", "TPT effectiveness:", 0.7, min = 0, max = 1, step=0.05, width="200px"),
    numericInput("pRTPT", "protection against reinfection after TPT:", 0.62, min = 0, max = 1, step="0.02", width="200px"),
    actionButton("go","Go")
  ),
  mainPanel(
    plotOutput("rev",height = "600px")
  )
))
shinyApp(ui,server)
