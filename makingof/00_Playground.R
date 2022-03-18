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


slurs <- gtrendsR::gtrends(keyword = c("nigga", "faggot"), time = "all", onlyInterest = T)

plot(slurs)

rm(ecotrading)

eco <- gtrendsR::gtrends(keyword =("ecotrading"), geo = "it", time = "all", onlyInterest = T)

plot(eco)

res <- gtrends(c("nhl", "nba"), geo = c("CA", "US"))
plot(res)



###à


key <- c("rider")
geo <- c("US")
channel <- "web"
time <- ("all")

rider <- gtrends(key, geo, channel, time = time)

plot(rider)

