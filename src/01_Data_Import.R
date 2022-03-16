##Data Import complete

library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)
library(rio)

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

DATASET <- DATASET[-c(2,3,6,32,39,41,44,46,48,49,57,58,61,64:110)]

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

DATASET_1 <- rbind(group_data1, group_data2, group_data3, group_data4, group_data5,
                       group_data6, group_data7, group_data8, group_data8.2, group_data.9, group_data.10)



view(DATASET_1)


export(DATASET_1, "Dataset_1.csv")







