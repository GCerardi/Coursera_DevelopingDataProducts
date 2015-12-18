library(shiny)
library(dplyr)

myData <- read.csv("PIXAR.csv")

shinyServer(
	function(input, output) {
	
		output$myChart <- renderPlot({
			if (input$check == 1) ({
				p1 <- plot(myData$Budget_M, myData$Worldwide_gross_box_office_performance,
						   xlab = "Budget ($M)", ylab = "Worldwide Gross Revenues ($M)",
						   xlim = c(0,200), ylim = c(0,1200), col = "red", pch = 19, cex = 2)
				abline(a=0, b=1, col = "red")
				text(myData$Budget_M, myData$Worldwide_gross_box_office_performance, labels = myData$Title,
				cex = 0.7, pos = 2)
				return(p1)
			})
			if (input$check == 2) ({
				myData2 <- filter(myData, Nominated_Academy_Award == "Y")
				p1 <- plot(myData2$Budget_M, myData2$Worldwide_gross_box_office_performance,
						   xlab = "Budget ($M)", ylab = "Worldwide Gross Revenues ($M)",
						   xlim = c(0,200), ylim = c(0,1200), col = "purple", pch = 19, cex = 2)
				abline(a=0, b=1, col = "purple")
				text(myData2$Budget_M, myData2$Worldwide_gross_box_office_performance, labels = myData2$Title,
				cex = 0.7, pos = 2)
				return(p1)
			})
			if (input$check == 3) ({
				myData3 <- filter(myData, Won_Academy_Award == "Y")
				p1 <- plot(myData3$Budget_M, myData3$Worldwide_gross_box_office_performance,
						   xlab = "Budget ($M)", ylab = "Worldwide Gross Revenues ($M)",
						   xlim = c(0,200), ylim = c(0,1200), col = "blue", pch = 19, cex = 2)
				abline(a=0, b=1, col = "blue")
				text(myData3$Budget_M, myData3$Worldwide_gross_box_office_performance, labels = myData3$Title,
				cex = 0.7, pos = 2)
				return(p1)
			})			
		
		
		})
	}
)