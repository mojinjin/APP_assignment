library(shiny)

library(shiny)
library(genetics)
resulHWE <- function(coho, hete, raho)HWE.chisq(genotype(c(rep("A/A",coho), rep("A/a", hete), rep("a/a", raho))))


shinyServer(
  function(input, output){
    output$samplecount <- renderPrint({sum(input$coho,input$hete, input$raho)})
    output$stat <- renderPrint({resulHWE(input$coho, input$hete, input$raho)$statistic})
    output$pval <- renderPrint({resulHWE(input$coho, input$hete, input$raho)$p.value})
    
  }
)