library(tidyverse)
library(rio)
library(wordcloud2)
library(tidytext)
library(stopwords)

data <- import("Complete_dataset(cleanedREGEXS).csv")

text <- data_frame(Text=data$keyword)

words <- text %>% 
  unnest_tokens(output = word, input = Text)

stop <- get_stopwords(language = "en")

counts <- words %>% 
  count(word, sort = TRUE)

counts <- counts %>% 
  anti_join(stop)


virus_counts$word <- str_remove_all(virus_counts$word, ".*â|un|ï|š|ðÿ||rã|gã|ntã|.co|hp|oal|pu|gag|amp|re|cdc")
virus_counts$word <- str_remove_all(virus_counts$word, "t.co|https")
virus_counts$word <- str_remove_all(virus_counts$word, "\\bs\\b")
virus_counts$word <- str_remove_all(virus_counts$word, "\\bt\\b")

counts$word <- str_remove_all(counts$word, "ettore")
virus_counts <- virus_counts[-which(virus_counts$word==""), ]


wordcloud2(counts,size = 0.5)
