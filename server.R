library(shiny)
library(quantmod)

getSymbols(c("GOOG", "AAPL", "MSFT"))


shinyServer(function(input, output) {
	output$stockSymbolOutput <- renderText({input$stockSymbol})
	
	output$stockPlot <- renderPlot({
		if(input$stockSymbol == "GOOG")
			stockData = GOOG
		else if(input$stockSymbol == "AAPL")
			stockData = AAPL
		else if(input$stockSymbol == "MSFT")
			stockData = MSFT
		
		
		if(length(input$indicators) == 0)
			candleChart(stockData, subset='2014-07::', TA=c(addVo())) 
		else if("bb" %in% input$indicators && "ma" %in% input$indicators)
			candleChart(stockData, subset='2014-07::', TA=c(addVo(), addBBands(n = 5), addSMA(col = "white")))
		else if("bb" %in% input$indicators)
			candleChart(stockData, subset='2014-07::', TA=c(addVo(), addBBands(n = 5)))
		else if("ma" %in% input$indicators)
			candleChart(stockData, subset='2014-07::', TA=c(addVo(), addSMA(col = "white")))
	})
	
	output$lastDividend <- renderText({
		dividends = getDividends(input$stockSymbol)
		value = "None"
		if(length(dividends))
			value = paste(tail(dividends, 1), "$", sep=" ") 
		
		value
	})
})