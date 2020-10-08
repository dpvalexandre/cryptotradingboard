#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = 'Cryptradingboard'),
      shinydashboard::dashboardSidebar(disable = TRUE),
      shinydashboard::dashboardBody(
      fluidRow(
        column(width=12,
               p("Hello and welcome to my own version coinmarket cap. To make this website, I used Rshiny, an R framework for making web application and also several API from coingecko and coinmarketcap. Keep in mind that this website in it's early stage of developpment before making any trade based on what you can see here.")
               ),
        column(width = 12,
               DT::DTOutput("crypto_info"))
        )
        
      )
      
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'cryptotradingboard'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

