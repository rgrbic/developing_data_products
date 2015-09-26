# ui.R
source("helper.R")

inputTextarea <- function(inputId, value="", nrows, ncols) {
    tagList(
        singleton(tags$head(tags$script(src = "textarea.js"))),
        tags$textarea(id = inputId,
                      #class = "inputtextarea",
                      class="form-control",
                      placeholder="enter some text",
                      maxlength="10000",
                      rows = nrows,
                      cols = ncols,
                      as.character(value))
    )
}


shinyUI(fluidPage(
    titlePanel("text analyst"),
    
    sidebarLayout(
        sidebarPanel(
            h4("About application:"),
            p("This application counts number of occurrences of each word in the text. 
              Number of charachters in text is limited to 10000. The text area is already filled but you can delete the text and insert your own.", align = "justify"),
            br(),
            p("Choose between two plots. First one is popular word cloud plot, the other is barplot of word occurrences.", align = "justify"),
            br(),
            radioButtons("radioBtn", label ="Set plot:",
                         choices = list("Word cloud" = 1, "Bar plot of frequency" = 2), selected = 1)
        ),
        
        mainPanel(            
            inputTextarea('textOriginal', song, 10, 60),
            textOutput("text1"),
            plotOutput("plotWords")
            
        )
    )
))