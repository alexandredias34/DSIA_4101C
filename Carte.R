#creation of a world map with circles of different colors, using the data from data_util.csv for the location of the circles

#using tidyverse
library(tidyverse)
library(readr)
library(ggplot2)
library(maps)

#read the data from data_util.csv
df_carte <- read_csv("data_util.csv")

#keep only the data we want to use : filiere,latitude,longitude,nom_commune
df_carte <- df_carte %>% select(filiere, latitude, longitude, nom_commune)
filiere <- unique(df_carte$filiere)
#Creation of the map using ggplot2
ggplot() +
  geom_polygon(data = map_data("france"), aes(x = long, y = lat, group = group), fill = "white", color = "black") +
  coord_fixed(1.3) +
  geom_point(data = df_carte, aes(x = longitude, y = latitude, color = filiere), size = 0.7) +
  theme_void() +
  theme(legend.text = element_text(size=8),legend.position = "bottom")
#save the map as png in the www folder
ggsave("www/Carte.png", width = 10, height = 10)