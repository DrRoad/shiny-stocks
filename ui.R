library(shiny)

# Define UI for application that draws a histogram
shinyUI(
	fluidPage(
		titlePanel("Stock informations"),
		
		
		sidebarLayout(
			sidebarPanel(
				selectInput(
					"stockSymbol", 
					label = h4("Stock symbol"), 
					choices = list("Google" = "GOOG", "Apple" = "AAPL", "Microsoft" = "MSFT"), 
					selected = 1
				)
			),
			
			mainPanel(
				h4("You've selected :"),
				verbatimTextOutput("stockSymbolOutput"),
				br(),
				plotOutput("stockPlot")
			)
		)
	)
)
