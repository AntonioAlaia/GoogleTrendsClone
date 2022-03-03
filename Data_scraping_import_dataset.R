library(gtrendsR)
library(tidyverse)
library(rvest)

##Data Import and Preparation with gtrendsR
#This is the starting list I've found online on "patriaindipendente.it", from here we are starting to obtain the related queries

lista_nera <- "https://www.patriaindipendente.it/persone-e-luoghi/inchieste/la-galassia-nera-su-facebook/"

download.file(url = lista_nera, 
              destfile = here::here("ListaNera.html"))

scrap_listaNera <- read_html(here::here("ListaNera.html")) %>% 
  html_elements(css = "p:nth-child(24) em , p b") %>% 
  html_text(trim = TRUE)

view(scrap_listaNera)


#Creating function to divide the list in smallest possible to reach 5 x group: we have to do this because gtrendsR doesn't 
#allow us to look for more than 5 keywords at once

divideR <- function(x,n) split(x, cut(seq_along(x), n, labels = FALSE)) 

dvd_listaNera <- divideR(scrap_listaNera, 7)

view(dvd_listaNera)


#Using gtrendsR to get the queries 


test1_listaNera <- gtrends(keyword = dvd_listaNera$'1', 
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)
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
test8_listaNera <- gtrends(keyword = c("8chan","8kun","pillola rossa","olocausto italiano","grande sostituzione"),
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)



list_1 <- test1_listaNera$related_queries$value
list_2 <- test2_listaNera$related_queries$value
list_3 <- test3_listaNera$related_queries$value
list_4 <- test4_listaNera$related_queries$value
list_5 <- test5_listaNera$related_queries$value
list_6 <- test6_listaNera$related_queries$value
list_7 <- test7_listaNera$related_queries$value

LIST <- c(list_1, list_2, list_3,list_4,list_5,list_6,list_7)

view(LIST)

DATASET <- unique(LIST)

view(DATASET)

##more cleaning

DATASET <- DATASET[-c(2, 3,4,  5, 13, 14, 15, 16, 21, 28, 30, 33, 35, 38, 
                      39, 47, 48,49,50,57,58,62,65:111)]


view(DATASET)

DATASET <- divideR(DATASET, 9)





                            