get_coin_info <- function (vs_currency ="vs_currency=usd&", 
                           order = "order=market_cap_desc&", 
                           per_page = "per_page=100&" , 
                           page = "page=1&", 
                           price_change_percentage = "price_change_percentage=24h%2C7d%2C30d" ){
  
  base_url <- "https://api.coingecko.com/api/v3/"
  endpoint <- "coins/markets?"
  
  
 response <- httr::GET(paste0("https://api.coingecko.com/api/v3/", "coins/markets?", vs_currency, order, per_page, page, price_change_percentage))
 jsonlite::parse_json(response)%>%
   purrr::map(purrr::compact)%>%
   purrr::map_dfr(tibble::as_tibble)%>%
   dplyr::select(image, name, current_price, market_cap, total_volume, price_change_percentage_24h_in_currency, price_change_percentage_7d_in_currency, price_change_percentage_30d_in_currency )%>%
   dplyr::distinct()%>%
   dplyr::mutate(coin = paste0("<img src=", image,"alt='cryptocurrency logo' height = 32/> ", name),
                 price_change_percentage_24h_in_currency = price_change_percentage_24h_in_currency / 100,
                 price_change_percentage_7d_in_currency = price_change_percentage_7d_in_currency / 100,
                 price_change_percentage_30d_in_currency = price_change_percentage_30d_in_currency / 100
                 )%>%
   dplyr::select(-image, -name)%>%
   dplyr::select(coin, dplyr::everything())
}


