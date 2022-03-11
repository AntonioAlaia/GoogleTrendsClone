#Data preparation for the analysis and visualization!

##backup code 
DATASET_TOTAL <- rbind(group_data1, group_data2, group_data3, group_data4, group_data5,
                       group_data6, group_data7, group_data8, group_data8.2, group_data.9, group_data.10)
##

library(tidyverse)
library(stringr)

view(DATASET_TOTAL)

DATASET_TOTAL$hits <- as.numeric(as.character(DATASET_TOTAL$hits))

DATASET_TOTAL <- DATASET_TOTAL[DATASET_TOTAL$hits != 0 & DATASET_TOTAL$hits != 1 
                               & DATASET_TOTAL$hits != 2 & DATASET_TOTAL$hits != 3
                               & DATASET_TOTAL$hits != 4 & DATASET_TOTAL$hits != 5, ] 
                                
DATASET_TOTAL <- na.omit(DATASET_TOTAL)



## MERGING IT WITH THE NEW DATASET!#



FINAL <- rbind(DATASET_TOTAL, trends)

FINAL$hits <- as.numeric(as.character(FINAL$hits))

FINAL <- FINAL[FINAL$hits != 0 & FINAL$hits != 1 
               & FINAL$hits != 2 & FINAL$hits != 3
               & FINAL$hits != 4 & FINAL$hits != 5, ] 
FINAL <- na.omit(FINAL)




##

ggplot(DATASET_TOTAL, aes(x=date, y=hits)) +
  geom_point(aes(date, hits,color = keyword), position = 'jitter') +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme(legend.position = "none")
  theme_bw()

###### YES
  
  
x <-lm(date ~ hits, data=DATASET_TOTAL)

summary(x)
cor.test(x, method="pearson")
lm
##

install.packages("ggpubr")
library(ggpubr)

cor.test(DATASET_TOTAL$date, DATASET_TOTAL$hits, method=c("pearson", "kendall", "spearman"))
