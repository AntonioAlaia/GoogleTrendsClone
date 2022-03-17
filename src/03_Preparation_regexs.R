library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)
library(rio)

COMPLETE_DATASET <- import("Complete_dataset.csv")


COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"mussolini|Mussolini|Muti|forza italia|meloni|^Benito|Camice Nere|- Aforismi|- DUX|	
BENITO MUSSOLINI|Camicie Nere|carlo taormina| ")


COMPLETE_DATASET <- COMPLETE_DATASET[-which(COMPLETE_DATASET$keyword==""), ]

view(COMPLETE_DATASET)

export(COMPLETE_DATASET, "Complete_dataset(cleanedREGEXS).csv")



##Adding a new list


stormfront <- read_html(here::here("Stormfront.html")) %>% 
  html_elements(css = "#posts .alt1 a") %>% 
  html_text(trim = TRUE)

view(stormfront)


##Some manual cleaning, sigh

stormfront <- c("Der Strumer in italiano", "ebrei nemico occulto", "giudeo bolscevismo","piano giudaico massonico","internazionale ebraica",
                "der ewidge jude","forces occultes 1943","suss l’ebreo ","banche ebraiche sovietici","ebreo lenin mente","questione ebraica","truffatori ebrei",
                "movimento omosessuale ebrei","il dividendo dei Rothschilds Waterloo","mario monti ebrei","cospirazione kosher matthew hale","pericolo islam",
                "contro il filoislamismo","progetto grande califfato","bibbia dell’antislamismo","il pericolo giallo","negrolandia inferno morti",
                "difendere identità biologica","diffondere identità razziale","nazionalismo bianco","W.L. Pierce italiano","controllo giudaico mass media",
                "invasione allogeni","rhodesia paradiso a inferno","11 settembre la verità","critiche globalizzazione","ida magli",
                "gilberto oneto bugie immigrati","pericolo rom","druido verità piccone", "giorno memoria malattia mentale","lorenzoni scritti essenziali",
                "protocolli sion falsi","miracolo economico hitler","the colour of crime italiano","rushton razza","aplogruppi chi sono","ebrei e sindrome Laron",
                "teorie Armand Marie Leroi","verità meticciato","Jared Tayler razza","Genius Seculi","Giacinto auriti guerra sangue","Wissen Macht Frei in italiano",
                "American Dissident Voices ita","piano giudaico kalergi italiano","savitri devi femminismo nazionalsocialismo")

stormfront[1]

##GTRENDS

DATASET_3 <- vector()
v <- vector()

for (i in 1:108) {
  tryCatch({v <- gtrendsR::gtrends(keyword = stormfront[i], geo = "IT", time = "2020-01-01 2022-02-28")},
           error = function(e){})
  cat(i, " ")
  v <- as.data.frame(v$related_queries)
  DATASET_3 <- rbind(DATASET_3, v)
}

view(DATASET_3)

