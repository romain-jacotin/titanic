
library(shiny)
library(e1071)

data(Titanic)
df <- as.data.frame(Titanic)
mod <- naiveBayes(Survived ~ ., data = Titanic)

shinyServer( function(input, output) {
    output$plot1 <- renderPlot({

        selectedData <- df[df$Class==input$cl & df$Sex==input$se & df$Age==input$ag,5]
        bplt <- barplot(selectedData,
                        beside=TRUE, horiz=TRUE, xlim=c(0,700),
                main="Titanic stats based on selected passengers's attributes",
                ylab="Total",
                col=c("black", "grey"),
                legend = c("Deads", "Survivors")
                )
        text(x=selectedData+20,
             y=bplt,
             labels=as.character(selectedData),
             xpd=TRUE)
        })
    output$result <- renderText({ 
        r <- predict(mod, df[df$Class==input$cl & df$Sex==input$se & df$Age==input$ag & df$Survived=="Yes",1:3])
        levels(r)[r]
})
})




