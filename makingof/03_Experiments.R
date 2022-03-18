library(gtrendsR)
library(tidyverse)
library(rvest)
library(httr)
library(curl)

tourism <- gtrends(keyword = c("Italy aa", "England flights", "Greece flights"), time = "today+5-y")

tourism$interest_over_time

plot(tourism)

skyscanner <- gtrends(keyword = "skyscanner", time = "today+5-y")

plot(skyscanner)

mask <- gtrends(keyword = "mask", time = "today+5-y")

plot(mask)

bitcoin <- gtrends(keyword = key, time = "today 12-m") 

plot(bitcoin)
 
key <- "aaa"

/////
  
  
download.file(url = "https://www.imdb.com/title/tt0096697/episodes?season=32", 
                destfile = here::here("season_32.html"))