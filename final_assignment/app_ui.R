library(shiny)
library(ggplot2)
library("markdown")
library("plotly")

introduction <- tabPanel(
  "Introduction",
  fluidRow(
    column(
      12,
      uiOutput('markdown')
    )
  )
)

interactive <- tabPanel(
  "Visualization",
  sidebarLayout(
    
    position = "left",
    
    sidebarPanel(
      
      selectInput(
        "ptype", "Select the plot",
        c(
          "Scatter Plot CO2" = "scatter",
          "Line Plot GDP" = "line",
          "Line Plot Population" = "line2"
          )
      ),
      
      color_input <- selectInput("color", label = "Color", choices = list("Grey" = "grey", "Yellow" = "yellow", "blue" = "Blue")),
      
      size_input <- sliderInput("size", label = "Size", min = 0.1, max = 2, value = 2)
      
    ),
    
    mainPanel(
      plotlyOutput("plot"),
      p("Japan's GDP, population, and CO2 emissions (in million tons) from 1990 to 2021 are depicted in this graph 1990 to 2021. These three graphs show the relationships and trends of GDP, population, and CO2 emissions. In the left sidebar, users can modify the lines and dots' color and size. These charts show that all GDP, population, and CO2 emissions are all on the rise. From 2010 to 2020, CO2 emissions
due to a reduction in population growth, exhibit a downward trend. This illustrates how connected they are to one another. Because they offer a clear picture of the trend and are simple to read, these plots include scatter and line plots.")
    )
  )
)

Summary <-tabPanel(
  "Summary",
  p("Overall, there is a strong correlation between GDP and population and CO2 emissions. 
Unavoidably, this causes CO2 emissions to rise.
Although high carbon dioxide emissions seriously damage the environment and human health, they are intimately tied to economic status.
It is closely correlated with a nation's population and level of economic development. We must act logically.
due to carbon emission."),
  verbatimTextOutput("Summary")
)

ui <- navbarPage(

  title = "Climate Change",
  
  windowTitle = "Climate Change",
  
  position = "fixed-top",
  
  header = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("Zhien He
          December 9, 2022
        "),
    hr()
  ),
  
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("INFO 201 A Au 22: Assignment 5"),
    hr()
  ),
  introduction,
  
  interactive
)