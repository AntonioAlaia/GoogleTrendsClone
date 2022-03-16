library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)


#I found a new list and I added some new contents, here's the new dataset


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



##More cleaning and merging with each others


view(DATASET_TOTAL)

DATASET_TOTAL$hits <- as.numeric(as.character(DATASET_TOTAL$hits))

DATASET_TOTAL <- DATASET_TOTAL[DATASET_TOTAL$hits != 0 & DATASET_TOTAL$hits != 1 
                               & DATASET_TOTAL$hits != 2 & DATASET_TOTAL$hits != 3
                               & DATASET_TOTAL$hits != 4 & DATASET_TOTAL$hits != 5, ] 

DATASET_TOTAL <- na.omit(DATASET_TOTAL)




FINAL <- rbind(DATASET_TOTAL, trends)

FINAL$hits <- as.numeric(as.character(FINAL$hits))

FINAL <- FINAL[FINAL$hits != 0 & FINAL$hits != 1 
               & FINAL$hits != 2 & FINAL$hits != 3
               & FINAL$hits != 4 & FINAL$hits != 5, ] 
FINAL <- na.omit(FINAL)



view(FINAL)



####I HAVE TO CLEAN IT FROM MUSSOLINI'S USELESS HITS
