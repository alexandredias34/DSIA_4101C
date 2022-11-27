library(readr)

# Read in the data
data <- read_csv("Data.csv")
geo <- read_csv("Geo.csv")

#Fix the data

#'In our case, the file Geo.csv has a column called code_commune_INSEE.
#'The problem is that some of the values are not 5 digits long.
#'We need to add a 0 in front of the value to make it 5 digits long.


# Add a 0 in front of the value if it is not 5 digits long
geo$code_commune_INSEE <- ifelse(nchar(geo$code_commune_INSEE) == 5, 
                                 geo$code_commune_INSEE, paste0("0", geo$code_commune_INSEE))

# Merge the data, we want to keep all the rows from data and only
 #the rows from geo that have a matching code_INSEE_commune

df_main <- merge(data, geo, by.x = "codeinseecommune", by.y = "code_commune_INSEE",
              all.y= FALSE)


# create a data frame with the data we want to keep : codeinseecommune, nom_commune, latitude, longitude, filiere, technologie, puismaxinstallee
df_util <- df_main[, c("codeinseecommune", "nom_commune", "latitude", "longitude", "filiere", "technologie", "puismaxinstallee")]

#delete the rows that have NA values
df_util <- na.omit(df_util)

#delete the rows that have a different value for filiere than the ones we want
df_util <- df_util[df_util$filiere %in% c("Eolien", "Solaire", "Hydraulique",
                                          "Bioénergie", "Thermique non renouvelable", "Autre",
                                          "Nucléaire", "Energies Marines"),]

#write the data frame to a csv file
write.csv(df_util, "data_util.csv", row.names = FALSE)
