##Creating the dataframe + cleaning

library(tidyverse)


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

DATASET <- DATASET[-c(2, 5, 13, 14, 15, 16, 21, 28, 30, 33, 35, 38, 
                          39, 47,49,50,57,58,62,65:111)]

DATASET <- divideR(DATASET, 9)


##TO BE CONTINUED