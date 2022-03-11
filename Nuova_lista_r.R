library(rvest)
library(tidyverse)
library(stringr)
library(gtrendsR)

https://www.patriaindipendente.it/progetto-facebook/lista_a.html

nuova_lista <- "https://www.patriaindipendente.it/progetto-facebook/lista_a.html"

download.file(url = nuova_lista, 
              destfile = here::here("nuovaLista.html"))

scrap_nuovaLista <- read_html(here::here("nuovaLista.html")) %>% 
  html_elements(css = "a") %>% 
  html_text(trim = TRUE)

view(scrap_nuovaLista)

new_list <- unique(scrap_nuovaLista)

scrap_nuovaLista
new_list <- new_list[-c(1)]

view(new_list)


#For loop for new dataset

trends <- vector()
v <- vector()


for (i in 1:446) {
  tryCatch({v <- gtrendsR::gtrends(keyword = new_list[i], geo = "IT", time = "2020-01-01 2022-02-28", onlyInterest = TRUE)},
           error = function(e){})
  cat(i, " ")
  v <- as.data.frame(v$interest_over_time)
  trends <- rbind(trends, v)
}

view(trends)


# Merging with previous dataset and cleaning

FINAL <- rbind(DATASET_TOTAL, trends)

FINAL$hits <- as.numeric(as.character(FINAL$hits))

FINAL <- FINAL[FINAL$hits != 0 & FINAL$hits != 1 
                           & FINAL$hits != 2 & FINAL$hits != 3
                           & FINAL$hits != 4 & FINAL$hits != 5, ] 
FINAL <- na.omit(FINAL)












