#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(rsconnect)
library(shiny)
#rsconnect::deployApp('C:/Users/usewr/Documents/RProject/Personal_Projects/Calculator')

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Phorus Calculator"),

    # Sidebar with a numeric and select input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "val1",label = "Input", value = 0),
            numericInput(inputId = "val2",label = "Input", value = 0),
            selectInput(inputId = "sign", label = "Select Operator",choices = c(" ","X","/","+","-","^","sin","cos","tan")),
            
            
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           verbatimTextOutput("result")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$result = renderText(
        
        if (input$sign == "X"){
            result = input$val1 * input$val2
            paste(result)
            
        }else if (input$sign == "/"){
            result = input$val1/input$val2
            paste(result)
            
        }else if (input$sign == "+"){
            result = input$val1 + input$val2
            paste(result)
            
        }else if (input$sign == "-"){
            result = input$val1 - input$val2
            paste(result)
            
        }else if (input$sign == "^"){
            counter = 1
            result =1
            while (counter<=input$val2) {
                result = result*input$val1
                counter=counter+1
            }
            paste(result)
        }else if (input$sign == "sin"){
            result = sin(pi*(input$val1/180))
            paste(result)
            
        }else if (input$sign == "cos"){
            result = cos(pi*(input$val1/180))
            paste(result)
            
        }else if (input$sign == "tan"){
            result = tan(pi*(input$val1/180))
            paste(result)
        }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
