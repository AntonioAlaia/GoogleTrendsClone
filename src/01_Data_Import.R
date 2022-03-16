##Data Import complete

library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)

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

DATASET <- DATASET[-c(1,3,5, 13,32,35,37,45,46,42,49,58,59,62,65:111)]

view(DATASET)

DATASET <- divideR(DATASET, 10)


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

group_3_onlytime <- gtrends(keyword = DATASET$'3',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

group_4_onlytime <- gtrends(keyword = DATASET$'4',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

group_5_onlytime <- gtrends(keyword = DATASET$'5',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

group_6_onlytime <- gtrends(keyword = DATASET$'6',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

group_7_onlytime <- gtrends(keyword = DATASET$'7',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)
group_8_onlytime <- gtrends(keyword = DATASET$'8',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

group_9_onlytime <- gtrends(keyword = DATASET$'9',
                            geo = "IT",
                            time = "2020-01-01 2022-02-28",
                            onlyInterest = TRUE
                            
)

group_10_onlytime <- gtrends(keyword = DATASET$'10',
                             geo = "IT",
                             time = "2020-01-01 2022-02-28",
                             onlyInterest = TRUE
                             
)

group_data1 <- as.data.frame(group_1_onlytime$interest_over_time)
group_data2 <- as.data.frame(group_2_onlytime$interest_over_time)
group_data3 <- as.data.frame(group_3_onlytime$interest_over_time)
group_data4 <- as.data.frame(group_4_onlytime$interest_over_time)
group_data5 <- as.data.frame(group_5_onlytime$interest_over_time)
group_data6 <- as.data.frame(group_6_onlytime$interest_over_time)
group_data7 <- as.data.frame(group_7_onlytime$interest_over_time)
group_data8 <- as.data.frame(test8_listaNera$interest_over_time)
group_data8.2 <-  as.data.frame(group_8_onlytime$interest_over_time)
group_data.9 <-  as.data.frame(group_9_onlytime$interest_over_time)
group_data.10 <-  as.data.frame(group_10_onlytime$interest_over_time) 

DATASET_TOTAL <- rbind(group_data1, group_data2, group_data3, group_data4, group_data5,
                       group_data6, group_data7, group_data8, group_data8.2, group_data.9, group_data.10)



view(DATASET_TOTAL)





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






