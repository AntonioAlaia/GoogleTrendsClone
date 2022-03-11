library(rvest)
library(tidyverse)
library(stringr)
library(gtrendsR)


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










