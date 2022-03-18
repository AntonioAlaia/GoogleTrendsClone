library(gtrendsR)
library(tidyverse)
library(rvest)
library(httr)
library(curl)


download.file(url = "https://en.wikipedia.org/wiki/List_of_conspiracy_theories", 
              destfile = here::here("theories_list.html"))

unst_list <- read_html(here::here("theories_list.html")) %>% 
  html_elements(css = ".toctext") %>% 
  html_text(trim = TRUE)

list <- as.vector(unst_list)

view(list)

80/5 # n=16

divideR <- function(x,n) split(x, cut(seq_along(x), n, labels = FALSE)) 

teo_16 <- divideR(list, 16)

view(teo_16)

teo1 <- teo_16[1]

teo1 <- as.character(teo1)


prova <- gtrends(keyword = teo1, time = "today+5-y")




for (i in )





view(teo1)

for (variable in 1:16) {
  
}

view(teo1)
##


#######


five_theo <- c("qanon", "chemtrails", "deep state", "soros", "illuminati")

five_res <- gtrends(keyword = five_theo, time = "today+5-y")

fi

prova <- five_res$interest_over_time

view(prova)
view(five_res)

str(five_res)

five_data <- as.data.frame(five_res)

ggplot(prova, aes(x=date, y=hits)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=FALSE) +
  theme_bw()


five_theo <- gtrendsR::gtrends(keyword = "ukraine", geo = "RU", time = "all", onlyInterest = T)

