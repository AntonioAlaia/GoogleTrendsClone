library(gtrendsR)
library(tidyverse)
library(rvest)


lista_nera <- "https://www.patriaindipendente.it/persone-e-luoghi/inchieste/la-galassia-nera-su-facebook/"

download.file(url = lista_nera, 
              destfile = here::here("ListaNera.html"))

scrap_listaNera <- read_html(here::here("ListaNera.html")) %>% 
  html_elements(css = "p:nth-child(24) em , p b") %>% 
  html_text(trim = TRUE)

view(scrap_listaNera)

divideR <- function(x,n) split(x, cut(seq_along(x), n, labels = FALSE)) 

dvd_listaNera <- divideR(scrap_listaNera, 7)

dvd_listaNera[2]



test1_listaNera <- gtrends(keyword = c("Forza Nuova","CasaPound Italia","Comunità militanti","Lealtà – Azione"), geo = "IT", time = "2020-01-01 2022-02-28")

view(test1_listaNera$related_queries)

(test1_listaNera$interest_over_time)

test2_listaNera <- gtrends(keyword = c("Generazione Identitaria","Movimento Patria Nostra","Azione Identitaria"),
                           geo = "IT",
                           time = "2020-01-01 2022-02-28"
)

plot()

ggplot(nuovo_ordine$interest_over_time, aes(x=date, y=hits)) +
  geom_line() 

nuovo_ordine <- gtrends(keyword = "Nuovo ordine nazionale",
                        geo = "IT",
                        time = "2020-01-01 2022-02-28"
                        )

plot(test1_listaNera)



ggplot(test1_listaNera$interest_over_time, aes(x=date, y=hits)) +
  geom_line() 


