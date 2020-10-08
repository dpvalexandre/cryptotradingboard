#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  

  
  
  output$crypto_info = DT::renderDT({
    DT::datatable(
      get_coin_info(),
      escape = FALSE,
      width = "100%",
      options = list(columnDefs = list(list(className = 'dt-center')), fixedHeader = TRUE),
      colnames = c("24h"=5 , "7d"=6,  "30d"=7),
      rownames = FALSE,
      selection = "single",
      extensions = 'Responsive'
    )%>% 
      DT::formatCurrency(c("current_price", "market_cap", "total_volume")) %>%
      DT::formatPercentage(digits = 2, c("24h", "7d", "30d"))%>% 
      DT::formatStyle(
        c('24h', "7d", "30d"),
        Color = DT::styleInterval(c(-10000, 0 , 100000), c('darkred','red', 'green', 'darkgreen'))
      )
    
    
  })

}
