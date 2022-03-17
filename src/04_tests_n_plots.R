library(gtrendsR)
library(tidyverse)
library(rvest)
library(stringr)
library(rio)


COMPLETE_DATASET_regex <- import("Complete_dataset(cleanedREGEXS).csv")


ggplot(COMPLETE_DATASET_regex, aes(x=date, y=hits)) +
  geom_point(aes(date, hits,color = keyword), position = 'jitter') +
  geom_smooth(method=lm , color="red", fill="#69b3a2", se=TRUE) +
  theme(legend.position = "none")
theme_bw()


##

ggplot(COMPLETE_DATASET_regex, aes(x=date, y=hits) ) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette=4, direction=1) +
  scale_x_datetime(date_breaks = "3 months") +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    legend.position='none'
  )


