library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)
library(rio)


#I found a new list and I added some new contents, here's the new dataset


nuova_lista <- "https://www.patriaindipendente.it/progetto-facebook/lista_a.html"

download.file(url = nuova_lista, 
              destfile = here::here("nuovaLista.html"))

scrap_nuovaLista <- read_html(here::here("nuovaLista.html")) %>% 
  html_elements(css = "a") %>% 
  html_text(trim = TRUE)

view(scrap_nuovaLista)

new_list <- unique(scrap_nuovaLista)

view(scrap_nuovaLista)

new_list <- new_list[-c(1)]

view(new_list)

#For loop for new dataset

DATASET_2 <- vector()
v <- vector()

for (i in 1:446) {
  tryCatch({v <- gtrendsR::gtrends(keyword = new_list[i], geo = "IT", time = "2020-01-01 2022-02-28", onlyInterest = TRUE)},
           error = function(e){})
  cat(i, " ")
  v <- as.data.frame(v$interest_over_time)
  DATASET_2 <- rbind(DATASET_2, v)
}

view(DATASET_2)

export(DATASET_2, "Dataset_2.csv")


##More cleaning and merging with each others

DATASET_1 <- import("Dataset_1.csv")

COMPLETE_DATASET <- rbind(DATASET_1, DATASET_2)

COMPLETE_DATASET$hits <- as.numeric(as.character(COMPLETE_DATASET$hits))

COMPLETE_DATASET <- COMPLETE_DATASET[COMPLETE_DATASET$hits != 0 & COMPLETE_DATASET$hits != 1 
               & COMPLETE_DATASET$hits != 2 & COMPLETE_DATASET$hits != 3
               & COMPLETE_DATASET$hits != 4 & COMPLETE_DATASET$hits != 5, ] 
COMPLETE_DATASET <- na.omit(COMPLETE_DATASET)


COMPLETE_DATASET$hits <- as.numeric(as.character(COMPLETE_DATASET$hits))

COMPLETE_DATASET <- COMPLETE_DATASET[COMPLETE_DATASET$hits != 0 & COMPLETE_DATASET$hits != 1 
                               & COMPLETE_DATASET$hits != 2 & COMPLETE_DATASET$hits != 3
                               & COMPLETE_DATASET$hits != 4 & COMPLETE_DATASET$hits != 5, ] 

COMPLETE_DATASET <- na.omit(COMPLETE_DATASET)


export(COMPLETE_DATASET,"Complete_dataset.csv")




