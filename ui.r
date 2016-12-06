library(shiny)

checkbox <- function(){
  data <- read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
  result <- as.vector(data[,1])
  names(result) <- result
  return (result)
}

shinyUI(pageWithSidebar(
  headerPanel("GDP of different countries"),
  
  sidebarPanel(
    checkboxGroupInput("country", "Select country:", checkbox())
  ),
  
  mainPanel(
    plotOutput("plot", height = "800px")
  )
))