library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)
library(rio)

COMPLETE_DATASET <- import("Complete_dataset.csv")

view(COMPLETE_DATASET)

COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"mussolini")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"Mussolini")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"Muti")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"forza italia")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"meloni")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"^Benito")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"mussolini")
COMPLETE_DATASET$keyword <- str_remove_all(COMPLETE_DATASET$keyword,"Camice Nere")





COMPLETE_DATASET <- COMPLETE_DATASET[-which(COMPLETE_DATASET$keyword==""), ]


