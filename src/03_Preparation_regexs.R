library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)
library(rio)

COMPLETE_DATASET <- import("Complete_dataset.csv")


COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"mussolini|Mussolini|Muti|forza italia|meloni|^Benito|Camice Nere|- Aforismi|- DUX|	
BENITO MUSSOLINI|Camicie Nere|carlo taormina| ")


COMPLETE_DATASET <- COMPLETE_DATASET[-which(COMPLETE_DATASET$keyword==""), ]

view(COMPLETE_DATASET)

export(COMPLETE_DATASET, "Complete_dataset(cleanedREGEXS).csv")



##Aggiunta nuova lista


stormfront <- "https://www.stormfront.org/forum/t726675/"

download.file(url = lista_nera, 
              destfile = here::here("ListaNera.html"))

scrap_listaNera <- read_html(here::here("ListaNera.html")) %>% 
  html_elements(css = "p:nth-child(24) em , p b") %>% 
  html_text(trim = TRUE)
