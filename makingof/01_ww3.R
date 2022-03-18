library(gtrendsR)
library(tidyverse)
library(rvest)
library(httr)
library(curl)

install.packages("forecast")
library(forecast)

ww3 <- gtrendsR::gtrends(keyword = key, time = "all", onlyInterest = T)

plot(ww3)

ww3_testing <- gtrends("ww3")

view(ww3_testing$related_queries)


ucraine <- gtrends("ukraine")

related_Ukraine <- ucraine$related_queries$value

related_Ukraine <- as.data.frame(related_Ukraine)

view(related_Ukraine)

Russian <- gtrendsR::gtrends(keyword = "ukraine", geo = "RU", time = "all", onlyInterest = T)

plot(Russian)

try_geo <- gtrendsR::gtrends(keyword = "milano", geo = "IT", time = "all", onlyInterest = T)

