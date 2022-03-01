##dataframe

library(tidyverse)

dataset <- scrap_listaNera

view(list_1)

list_1 <-  as.list(test1_listaNera$related_queries)

dataset <- append(dataset, list_1$value)

list_2 <- as.list(test2_listaNera$related_queries)

dataset <- as.data.frame(
  append(dataset, list_2$value)
)

view(dataset)

dataset <- sapply(dataset, unique)

dataset <- as.data.frame(dataset)

view(dataset)

list_3 <- as.list(test3_listaNera$related_queries)

dataset <- append(dataset, list_3$value)


list_1 <- test1_listaNera$related_queries$value
list_2 <- test2_listaNera$related_queries$value
list_3 <- test3_listaNera$related_queries$value
list_4 <- test4_listaNera$related_queries$value
list_5 <- test5_listaNera$related_queries$value
list_6 <- test6_listaNera$related_queries$value
list_7 <- test7_listaNera$related_queries$value

LIST <- c(list_1, list_2, list_3,list_4,list_5,list_6,list_7)

view(LIST)

LIST <- as.data.frame(LIST)

DATASET <- sapply(LIST, unique)

view(DATASET)
