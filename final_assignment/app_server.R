library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(knitr)

# Reading data
co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
source("Source/co2-data-datawrangling.R")

US_lowest_co2 <- co2_data %>% 
  filter(country == "United States") %>%
  summarise(min_co2 = min(co2))

US_avg_co2 <- co2_data %>%
  filter(country == "United States") %>%
  summarise(ave_co2 = sum(co2) / length(year))

max_co2_japan <- co2_data %>%
  filter(country == "Japan") %>%
  filter(year == max(year)) %>%
  pull(co2)

server <- function(input, output) {
  
  output$plot <- renderPlotly(
    if(input$ptype == "scatter") {
      p1 <- co2_data %>%
        filter((1990 <= year & year <= 2021)) %>%
        filter(country == "Japan") %>%
        ggplot(aes(x = year, y = co2)) +
        geom_point(size = input$size, colour = input$color) +
        labs(
          x = "Year",
          y = "Emissions of CO₂ (million tonnes)",
          title = paste("Annual total production-based emissions of CO2 in Japan. (1990-2021)"),
          p("This plot reflects the trend of CO2 in Japan. (1990-2021).")
        )
      p1 <- ggplotly(p1)
    } else if(input$ptype == "line") {
      p2 <- co2_data %>%
        filter((1990 <= year & year <= 2021)) %>%
        filter(country == "Japan") %>%
        ggplot(aes(x = year, y = gdp)) +
        geom_area(fill = input$color) +
        geom_line(
          color = input$color,
          size = input$size,
          linetype = 1
        ) +
        scale_y_continuous(labels = scales::comma) +
        labs(
          x = "Year",
          y = "GDP ($)",
          title = paste("Annual total GDP in Japan. (1990-2021)"),
          p("This plot is the reflection of GDP in Japan. (1990-2021).")
        )
      p2 <- ggplotly(p2)
    } else if(input$ptype == "line2") {
      p3 <- co2_data %>%
        filter((1990 <= year & year <= 2021)) %>%
        filter(country == "Japan") %>%
        ggplot(aes(x = year, y = population)) +
        geom_line(
          color = input$color,
          size = input$size,
          linetype = 2
        ) +
        scale_y_continuous(labels = scales::comma) +
        labs(
          x = "Year",
          y = "Population",
          title = paste("Population of Japan. (1990-2021)"),
          p("This plot is the reflection of population in Japan. (1990-2021).")
        )
      p3 <- ggplotly(p3)
    }
  )
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('Source/Introduction.Rmd', quiet = TRUE)))
  })
}