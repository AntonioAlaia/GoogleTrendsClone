library(gtrendsR)
library(tidyverse)
library(rvest)

##Data Import and Preparation with gtrendsR

lista_nera <- "https://www.patriaindipendente.it/persone-e-luoghi/inchieste/la-galassia-nera-su-facebook/"

download.file(url = lista_nera, 
              destfile = here::here("ListaNera.html"))

scrap_listaNera <- read_html(here::here("ListaNera.html")) %>% 
  html_elements(css = "p:nth-child(24) em , p b") %>% 
  html_text(trim = TRUE)

view(scrap_listaNera)


#Creating function to divide the list in smallest possible to reach 5 x group

divideR <- function(x,n) split(x, cut(seq_along(x), n, labels = FALSE)) 

dvd_listaNera <- divideR(scrap_listaNera, 7)

view(dvd_listaNera)


#Using gtrendsR to get the queries

test1_listaNera <- gtrends(keyword = dvd_listaNera$'1', 
                           geo = "IT",
                           time = "2020-01-01 2022-02-28")



test2_listaNera <- gtrends(keyword = dvd_listaNera$'2',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)


test3_listaNera <- gtrends(keyword = dvd_listaNera$'3',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)

test4_listaNera <- gtrends(keyword = dvd_listaNera$'4',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)

test5_listaNera <- gtrends(keyword = dvd_listaNera$'5',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)

test6_listaNera <- gtrends(keyword = dvd_listaNera$'6',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)

test7_listaNera <- gtrends(keyword = dvd_listaNera$'7',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)

###

#coming back from Dataset.R


group_1_onlytime <- gtrends(keyword = DATASET$'1',
                           geo = "IT",
                           time = "2020-01-01 2022-02-28",
                           onlyInterest = TRUE
                           
)

group_2_onlytime <- gtrends(keyword = DATASET$'2',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

##NOT SOLVED

