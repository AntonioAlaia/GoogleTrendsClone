library(gtrendsR)
library(tidyverse)
library(rvest)
library(httr)
library(curl)

install.packages("devtools")
library(devtools)

devtools::install_github("PMassicotte/gtrendsR")


Scoobydoo <- gtrendsR::gtrends(keyword = c("Scooby doo"), time = "all", onlyInterest = T)

murda <- gtrendsR::gtrends(keyword = "murder",
                              time = "all",
                              gprop = c("web","news"),
                              onlyInterest = T)


try_with_2keys <- gtrendsR::gtrends(keyword = c("Scooby doo", "hello"), time = "all", onlyInterest = T)

plot(try_with_2keys)


hello <- gtrendsR::gtrends(keyword =("hello"), time = "all", onlyInterest = T)

plot(hello)



res <- gtrends(c("nhl", "nba"), geo = c("CA", "US"))
plot(res)



###à


key <- c("rider")
geo <- c("US")
channel <- "web"
time <- ("all")

rider <- gtrends(key, geo, channel, time = time)

plot(rider)

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
