library(ggplot2)
library(wordcloud)
source("helper.R")


shinyServer(function(input, output, session) {
    
    
    output$plotWords <- renderPlot({
        
        if(nchar(input$textOriginal)>1){
            wordsSorted <- getWords(paste(input$textOriginal))

            if (input$radioBtn == 1) {
                
                wordcloud(wordsSorted$x, wordsSorted$freq,
                          scale=c(6,.5),
                          min.freq=1, 
                          max.words=Inf,
                          colors = "steelblue")   
                
            }else if(input$radioBtn == 2){
                
                ggplot(data = wordsSorted[1:10,], aes(x=reorder(x, freq), y = freq)) + 
                    geom_bar(stat = "identity", fill = "steelblue") + 
                    coord_flip() + 
                    labs(y = "") + 
                    theme(axis.text.y = element_text(colour="grey20", size=14),
                          axis.text.x = element_text(colour="grey20", size=14)) +
                    labs(x = "")
             
            }
            
        }    
        
    })
    
}
)