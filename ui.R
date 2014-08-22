library(shiny)

# Define UI for application that draws a histogram
shinyUI(
	fluidPage(
		titlePanel("Stock graph"),
		br(),
		helpText("Select a stock symbol from the dropdown box below. This app will automatically display a candlestick chart
		of that stock price value from July 1st 2014 to now, along with the last dividend for the chosen stock."),
		helpText("You can also add two technicals indicators on the chart: the Simple Moving Average and the Bollinger Bands. If
				 you don't know what technical indicators are, feel free to visit the link below to get more insight."),
		a("Click here to get more information about technical indicators",     
		  href="http://en.wikipedia.org/wiki/Technical_analysis",
		  target="_blank"
		),
		br(),
		br(),
		br(),
		
		sidebarLayout(
			sidebarPanel(
				selectInput(
					"stockSymbol", 
					label = strong("Stock symbol"), 
					choices = list("Google" = "GOOG", "Apple" = "AAPL", "Microsoft" = "MSFT"), 
					selected = 1
				),
				br(),
				checkboxGroupInput(
					"indicators", 
					strong("Technical Indicators :"),
					c("Moving Average" = "ma", "Bollinger Bands" = "bb")
				)
			),
			
			mainPanel(
				h4("You've selected :"),
				verbatimTextOutput("stockSymbolOutput"),
				br(),
				plotOutput("stockPlot"),
				br(),
				br(),
				h4("Last dividend :"),
				verbatimTextOutput("lastDividend")
			)
		)
	)
)
