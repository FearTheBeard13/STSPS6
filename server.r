read.data <- function(){
  read.table("data.txt", sep = ";", header = TRUE, encoding = "UTF-8")
}

data <- read.data()

draw_ <- function(country, length){
  index <- 0
  
  for(i in 1:nrow(data)){
    if(data[i, 1] == country){
      index <- i
    }
  }
  
  if(index == 0){
    return()
  }
  
  plot(2:25, data[index, 2:25], type = "o", xaxt = "n", xlab = "Years", ylab = "Rate of GDP")
  title(data[index, 1])
  axis(1, at = 1:length(data),  labels = names(data))
}

draw <- function(country){
  if(is.null(country)){
    return()
  }
  
  par(mfrow = c(length(country), 1))
  
  for(i in 1:length(country)){
    draw_(country[i], length(country))
  }
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$country)
    })
  }
)