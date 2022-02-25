library(gtrendsR)
library(tidyverse)
library(rvest)


download.file(url = "https://www.wired.it/attualita/media/2021/05/10/teorie-complotto-fake-news-2021/", 
              destfile = here::here("Complotti_ITA.html"))

compl_ita <- read_html(here::here("Complotti_ITA.html")) %>% 
  html_elements(css = ".GallerySlideCaptionHedText-cZHlsU") %>% 
  html_text(trim = TRUE)

view(compl_ita)

key <- c(compl_ita[1], compl_ita[2], compl_ita[3], compl_ita[4], compl_ita[5])

view(key)


key <- as.vector(key)

compl_itaG <- gtrendsR::gtrends(keyword = c("soros rettiliano", "5g uccide", "cern buco nero", "teoria sabmyk", "grande reset"), geo = "IT", onlyInterest = T)

view(compl_itaG)


