
library(shiny)
library(e1071)

data(Titanic)
df <- as.data.frame(Titanic)

shinyUI( pageWithSidebar(
    headerPanel( "Naive Bayes Classifier applied to Titanic dataset"),
    sidebarPanel(
        img(src="titanic.jpg"),
        h4("Titanic passenger's attributes:"),
        br(),
        selectInput( "cl", "Class", levels(df[1,1]), "Crew"),
        selectInput( "se", "Sex", levels(df[1,2]), "Male"),
        selectInput( "ag", "Age", levels(df[1,3]), "Adult"),
        br(),
        h4("Naive Bayes associated prediction:"),
        br(),
        h5("Survived ?"),
        textOutput("result")
    ),
    mainPanel(
        h3("Titanic data set"),
        p("The Titanic data set provides information on the fate of 2.201 passengers on the fatal maiden voyage of the ocean liner, summarized according to economic status (class), sex, age and survival."),
        h3("Naive Bayes prediction"),
        p("Based on this data set this ShinyApp uses a Naive Bayes classifier prediction model and display the associated stats numbers based on passenger's attributes"),
        plotOutput('plot1')
    )
    ))

