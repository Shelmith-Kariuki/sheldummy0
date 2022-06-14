#' first_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 

mod_first_module_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    shiny::br(), 
    shiny::fluidRow(shiny::textOutput(ns("statement1"))),
    shiny::br(), shiny::br(), shiny::br(), 
    shiny::fluidRow(
      shiny::column(3, 
       shiny::selectInput(ns("person"), label = "Select person", choices = unique(my_people$name))),
      shiny::column(6, 
    shiny::textOutput(ns("statement2"))
      )
  )
  )
}
    
#' first_module Server Functions
#'
#' @noRd 
mod_first_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$statement1 <- shiny::renderText({
      
      paste0("This family has ", n_fam , " members. ")
      
    })
    
    output$statement2 <- shiny::renderText({
      
      mtu <- input$person
      person_name <- my_people %>% dplyr::filter(name %in% mtu) %>% dplyr::pull(name)
      person_age <- my_people %>% dplyr::filter(name %in% mtu) %>% dplyr::pull(age)
      
      paste0(person_name, " is ", person_age, " years old. ")
      
    })
  })
}
    
## To be copied in the UI
# mod_first_module_ui("first_module_ui_1")
    
## To be copied in the server
# mod_first_module_server("first_module_ui_1")
