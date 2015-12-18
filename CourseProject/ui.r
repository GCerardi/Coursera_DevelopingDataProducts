library(shiny)

shinyUI(pageWithSidebar(
		headerPanel("PIXAR Movies"),
		
		sidebarPanel(
			radioButtons("check", "Visualize:",
				c("All movies" = "1",
			      "Nominated Academy Award" = "2",
				  "Won Academy Award" = "3"),
				  selected = "1"),
				  
			tags$div(class = "header", checked = NA,
				tags$p("Visit PIXAR's YouTube Page"),
				tags$a(href="https://www.youtube.com/user/DisneyPixar", "Here!")
			)
		),
		
		mainPanel(
			h4("Budget vs. Revenues Chart"),
			plotOutput("myChart"),
			h5("*The straight line separates profitable movies from unprofitable ones")
		)
	))	
		