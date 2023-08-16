library(shiny)

ui <- fluidPage(
  titlePanel("Planificador de Eventos"),
  
  sidebarLayout(
    sidebarPanel(
      
      textInput(inputId = "nombre_evento",
                label = "Nombre del Evento:",
                placeholder = "Boda de María y Julio"),
      
      selectInput(inputId = "tema_evento",
                  label = "Tema del Evento:", 
                  choices = c("Boda", "Fiesta de Cumpleaños", "Conferencia", "Otro"),
                  multiple = FALSE),
      
      numericInput(inputId = "invitados", 
                   label = "Número de invitados", 
                   value = 58,
                   min = 25,
                   max = 120),
      
      selectInput(inputId = "provincia",
                  label = "Provincia:", 
                  choices = c("San José", "Alajuela", "Cartago", "Heredia", "Puntarenas", "Guanacaste", "Limón"),
                  multiple = FALSE)
    ),
    
    mainPanel(
      strong(h2("¡Vamos a planificar su día especial!", align = "center", style = "color:blue")),
      tags$hr(style = "border-color: blue;"),
      
      strong(h3("Detalles del Evento:")),
      br(),
      
      
      textOutput("nombre"),
      hr(),
      textOutput("tema"),
      hr(),
      textOutput("cantidad"),
      textOutput("resumen")
      
    )
  )
)


server <- function(input, output, session) #siempre tiene 3 argumentos 
{
  output$nombre <- renderText(paste0("Nombre del Evento: ", input$nombre_evento))
  
  output$tema <- renderText(paste0("Tema del Evento: ", input$tema_evento))
  
  output$resumen <- renderText(paste0("Número de Invitados y Ubicación: El Evento ", input$tema_evento, " tendrá ", input$invitados, " invitados", " y será llevado a cabo en ", input$provincia, "."))
}

shinyApp(ui, server) # siempre se escribe al final
