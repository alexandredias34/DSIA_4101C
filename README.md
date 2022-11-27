DSIA_4101C
=========================================================================================================

Guide d'utilisateur : 

Pour creer et visualiser le dashboard, il suffit d'executer le fichier app.R depuis Rstudio apres avoir ouvert le projet (DSIA_4101C.Rproj) depuis Rstudio ou l'explorateur de fichiers. 

=========================================================================================================

Conclusions de l'etude : 

L'installation la plus repandue en France est le solaire, le mix energetique solaire français est assez varie, avec des sources d'energie differentes en grand nombre. 
Les centrales nucleaires sont a proximite de cours d'eau, ce qui est logique au vu de leur systeme de refroidissement. 
On peut observer qu'elles produisent beaucoup plus d'energie que les autres sources de production. Un delta non negligeable est observable entre les productions des diverses centrales nucleaires, mais elles restent toutes tres superieures a celles des autres installations (hors hydraulique). 
 Nous avons pu observer que l'energie marine est assez peu repandue (hydroliennes). 

=========================================================================================================

Fichier app.R : 

Cree le dashboard, l'UI et le serveur en utilisant la librairie Shiny. 
Une meilleure maniere de faire cela aurait ete de le diviser en 3 fichiers, mais au vu de la complexite reduite de notre dashboard, cela serait excessif. 

Fichier Carte.R : 

Utilise les donnees de data_util.csv pour creer la carte en se servant des librairies tidyverse, readr, ggplot2, maps. 
La carte est ensuite sauvegardee dans le dossier www pour etre utilisee par le dashboard. 

Fichier Histo.R :
Utilise et traite les donnees de data_util.csv pour creer l'histogramme en se servant des librairies tidyverse, readr et ggplot2.
Utilise la fonction geom_bar pour creer l'histogramme et non la fonction geo_histogram car jugee trop peu pratique.     
Sauvegarde ensuite l'histogramme dans le dossier www pour etre utilise par le dashboard. 

Fichier SortData.R : 

Lit, traite et fusionne les donnees de Data.csv et Geo.csv afin de retourner data_util.csv, contenant les donnees codeinseecommune, nom_commune, latitude, longitude, filiere, technologie et puismaxinstallee. 
Ce csv est utilise par les fichiers Histo.R et Carte.R. SortData.R utilise la librairie readr pour lire les fichiers csv traites. 

=========================================================================================================

Journal de developpement : 

Changelog : 02/11/2022 

Creation de SortData

Changelog : 04/11/2022

Push de SortData apres reprise de service des serveurs ESIEE

Changelog : 05/11/2022

Debut de recherche sur la creation de l'histogramme
Allegement du code amenant plus de bugs 
Debut de carte

Changelog : 06/11/2022

Creation de la carte et de l'histogramme

Changelog : 10/11/2022

Amelioration de la carte 
Amelioration de l'histogramme

Changelog : 11/11/2022

Creation du dashboard
Amelioration visuelle de l'histogramme
Changement d'echelle de la carte
