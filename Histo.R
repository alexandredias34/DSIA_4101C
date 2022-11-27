library(readr)
library(tidyverse)
library(ggplot2)

df_histo <- read_csv("data_util.csv")

# create a data frame with the data we want to keep : 
#filiere,technologie,puismaxinstallee

df_histo <- df_histo[, c("filiere","puismaxinstallee")]

#create a function to transform the column puismaxinstallee to numeric
to_numeric <- function(x) {
  as.numeric(gsub(",", ".", x))
}
#apply the function to the column puismaxinstallee
df_histo$puismaxinstallee <- sapply(df_histo$puismaxinstallee, to_numeric)

#create df_histo_nucleaire that contains only the rows that have a value of filiere = "Nucléaire"
df_histo_nucleaire <- df_histo[df_histo$filiere == "Nucléaire",]

#count the number of duplicated rows in the column puismaxinstallee
df_histo_nucleaire$count <- as.numeric(duplicated(df_histo_nucleaire$puismaxinstallee))

#drop the duplicates in df_histo_nucleaire
#df_histo_nucleaire <- unique(df_histo_nucleaire)


#create a histogram with the data from df_histo_nucleaire and save it in a png file
ggplot(df_histo_nucleaire, aes(x = puismaxinstallee, y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Puissance maximale installée des centrales nucléaires",
       x = "Puissance maximale installée (KW)",
       y = "Nombre de centrales") +
  theme(text = element_text(size = 8),axis.text.x = element_text(angle = 90, hjust = 1,))
  ggsave("www/Histo_nucleaire.png")
  
  