##dataframe

library(tidyverse)

dataset <- scrap_listaNera

list_1 <-  as.list(test1_listaNera$related_queries)

dataset <- append(dataset, list_1$value)

list_2 <- as.list(test2_listaNera$related_queries)

dataset <- append(dataset, list_2$value)

view(dataset)

dataset <- sapply(dataset, unique)

view(dataset)

