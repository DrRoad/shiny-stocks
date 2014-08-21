library(shiny)
library(quantmod)

getSymbols(c("GOOG", "AAPL", "MSFT"))


shinyServer(function(input, output) {
	output$stockSymbolOutput <- renderPrint({input$stockSymbol})
	
	output$stockPlot <- renderPlot({
		if(input$stockSymbol == "GOOG")
			candleChart(GOOG, subset='2014') 
		else if(input$stockSymbol == "AAPL")
			candleChart(AAPL, subset='2014') 
		else if(input$stockSymbol == "MSFT")
			candleChart(MSFT, subset='2014') 
	})
})