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
