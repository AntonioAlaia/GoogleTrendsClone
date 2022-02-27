library(gtrendsR)
library(tidyverse)
library(rvest)


finder <- gtrends(keyword = "no vax", geo = "IT")

str(finder)

view(finder$related_topics)
view(finder$related_queries)

finder <- gtrends(keyword = "")


download.file(url = "https://www.bufale.net/the-black-list-la-lista-nera-del-web/", 
              destfile = here::here("SitiBufaleITA.html"))

fake_webITA <- read_html(here::here("SitiBufaleITA.html")) %>% 
  html_elements(css = "ul:nth-child(24) li") %>% 
  html_text(trim = TRUE)

fake_webITA


bufale_network_1 <- gtrends(keyword = c("Gianni Lannes", "Salto Quantico", "Tactical Media Crew"), geo = "IT") 

view(bufale_network$related_queries)





bufale_network_2 <- gtrends(keyword = c( "Tanker Enemy", "Jeda News", "Segni dal cielo", "Voxnews", "Blondet", "Pianeta Blu News"), geo = "IT") 

view(bufale_network_2$related_queries)




fake_webITA <- as.vector(fake_webITA)

view(fake_webITA)


divideR <- function(x,n) split(x, cut(seq_along(x), n, labels = FALSE)) 

fakeW_list_x5 <- divideR(fake_webITA, 6)

fakeW_list_x5

bufale_network_2 <- gtrends(keyword = fakeW_list_x5$`4`, geo = "IT") 

view(bufale_network_2$related_queries)

#Now?
