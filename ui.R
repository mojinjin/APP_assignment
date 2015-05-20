library(shiny)

shinyUI(fluidPage(
  headerPanel("Hardy-Weinberg Equilibrium Calculator"),
  
  sidebarLayout(
  sidebarPanel(
    h4(strong("INTRODUCTION")),
    helpText("The Hardy-Weinberg equilibrium is a principle stating that the genetic variation in a population will remain constant from one generation to the next in the absence of disturbing factors. When mating is random in a large population with no disruptive circumstances, the law predicts that both genotype and allele frequencies will remain constant because they are in equilibrium."),
    helpText("Here",em("Chi-sq Hardy-Weinberg equilibrium test"),"is used for such calculation, which is important in biallelic markers(SNPs, indels etc).Null hypothesis that genotypes distribution is under Hardy-Weinberg equilibrium is used(significance level α=0.05)."),
    br(),
    h4(strong("NOTE")),
    helpText("Enter observed counts for each genotype, then click ", strong("CALCULATE", style = "color:blue"),".The statistic",strong("X-squared"),"in the result panel indicates the difference between expected and observed values for genotype counts."),
    numericInput('coho', 'Common Homozygotes',1, min=0, max=2000, step=1),
    numericInput('hete', 'Heterozygotes',1, min=0, max=2000, step=1),
    numericInput('raho', 'Rare Homozygotes',1, min=0, max=2000, step=1),
    submitButton('CALCULATE'),width=7
   ),
  
  mainPanel(
    h4(strong('RESULT')),
    p('Samples Observed'),
    verbatimTextOutput("samplecount"),
    p('statistic'),
    verbatimTextOutput("stat"),
    p(em('p value')),
    verbatimTextOutput("pval"),
    helpText("* If", em("p value"),"is equal to or smaller than the significance level(α=0.05), it suggests that the observed data are inconsistent with the assumption that the null hypothesis is true, and thus that hypothesis must be rejected and the alternative hypothesis is accepted as true."),
    br(),
    helpText(strong("* Five forces leading to evolutionary change may affect the Hardy-Weinberg equilibrium:")),
    helpText("- mutation"),
    helpText("- gene flow"),
    helpText("- genetic drift"),
    helpText("- nonrandom mating"),
    helpText("- natural selection"),
    width=5
    )
  )
))