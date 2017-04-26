library(ggmap)
library(leaflet)
#library(rMaps)

# Geocoding (from address to latlon with google map)
#latlon = geocode( ecole$adresse[ec], output="latlon", source="google")
#ecole$lat[ec] = latlon$lat
#ecole$lon[ec] = latlon$lon


#save(data.ecole,file="dataecole.Rda") # as Rdata
#read.table(data.ecole,file="dataecole.csv", quote = F, sep = ",", row.names = F) # as csv

# m <- leaflet(data.ecole) %>%
#   addTiles() %>%
#   addMarkers(lng=data.ecole$lon, lat=data.ecole$lat) # , popup="Mouvement 2017"
# #  addCircleMarkers()
#   #addCircleMarkers(radius = ~nb_jeux)
# m