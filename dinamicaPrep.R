# This file is meant to have all the code used to prepare the raster files used for the initial test of a land use model in dinamica
# It uses the same functions and idea outlined in the rasterManipulation.R file, which outlines more of what each step is doing.
# This file simply just uses those ideas and works with the many files we need

# Libraries used
library(raster) 
library(rasterVis)
library(rgdal) 

# Extent wanted for all from the bigger files
extentWanted <- extent(-57, -54, -16, -12 )
plot(initialAdmin2)
newExtent <- select(initialAdmin2)

# Changing the working directory to dropbox. This command works differently for mac and windows so use the correct one
# Windows 
setwd("C:/Users/rodri/Dropbox/SESYNC GIS Database/")
# Mac
setwd("~/Dropbox/SESYNC GIS Database/") 
# The layers needed are: admin level 2, TNC ecoregions, Brazil Biomes, temperature, precipitation, elevation, population, protected areas, distance to towns, distance to ports, distance to roads, distance to rivers


# We will need to load all of these 
initial2012Image <- raster("Land_Use_Class/finalMaps/final_2012.tif") # Loading a tif file 
initial2013Image <- raster("Land_Use_Class/finalMaps/final_2013.tif")
initial2014Image <- raster("Land_Use_Class/finalMaps/final_2014.tif") 
initialAdmin2 <- raster("Admin/final_level2.tif")
initialAdmin1 <- raster("Admin/final_level1.tif")
initialAdmin0 <- raster("Admin/final_level0.tif")
initialEcoregions <- raster("Biomes/final_tnc_terr_ecoregions.tif")
initialBrazilBiomes <- raster("Biomes/final_Brazil_Biomes.tif")
initialTemperature <- raster("BiophysicalData/Temp_Precipitation/final_air.mon.ltm.v401.tif")
initialPrecipitation <- raster("BiophysicalData/Temp_Precipitation/final_precip.mon.ltm.v401.tif")
initialSlope <- raster("BiophysicalData/SRTMv4.1/final_Slope.tif")
initialElevation <- raster("BiophysicalData/SRTMv4.1/final_Elevation.tif")
initialPopulation <- raster("Population/final-v4-population-density_2010.tif")
initialProtectedAreas <- raster("Protected_Area/WDPA_Protected/final_WDPA_Sept2016-shapefile-polygons.tif")
initialTowns <- raster("Towns_Population/towns/final_POP_MAX__Towns_over50k.tif")
initialPorts <- raster("transport data/Ports/final_Ports.tif")
initialRoads <- raster("transport data/Roads_OpenStMap/OpenStreetMap_paved_unpaved/final_Merged_Roads_pave.tif")
initialRivers <- raster("transport data/sa_riv_30s/final_sa_riv_30.tif")
initialSlaughterhouses<- raster("Supply_Chain/Slaughter House/final_Fridges.tif")
initialProcessingFacilities <- raster("Supply_Chain/Processing Facilities/final_Processing.tif")

# Then a new image is created with the extent, as well as the projection(the projection can be found in the properties of the initial images)
mapWanted<- raster(crs = "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0", ext = extentWanted)

# We then crop the initial maps with the map we generated
new2012Image <- crop(initial2012Image, mapWanted)
new2013Image <- crop(initial2013Image, mapWanted)
new2014Image <- crop(initial2014Image, mapWanted)
finalAdmin2 <- crop(initialAdmin2, mapWanted) 
finalAdmin1 <- crop(initialAdmin1, mapWanted) 
finalAdmin0 <- crop(initialAdmin0, mapWanted)
finalEcoregions <- crop(initialEcoregions, mapWanted)
finalBrazilBiomes <- crop(initialBrazilBiomes, mapWanted)
finalTemperature <- crop(initialTemperature, mapWanted)
finalPrecipitation <- crop(initialPrecipitation, mapWanted)
finalSlope <- crop(initialSlope, mapWanted)
finalElevation <- crop(initialElevation, mapWanted)
finalPopulation <- crop(initialPopulation, mapWanted)
finalProtectedAreas <- crop(initialProtectedAreas, mapWanted)
finalTowns <- crop(initialTowns, mapWanted)
finalPorts <- crop(initialPorts, mapWanted)
finalRoads <- crop(initialRoads, mapWanted)
finalRivers <- crop(initialRivers, mapWanted)
finalSlaughterhouses <- crop(initialSlaughterhouses, mapWanted)
finalProcessingFacilities <- crop(initialProcessingFacilities, mapWanted)

# Finally they get written out - using INT2S for categorical and integer continuous variables, and FLT4S for non-integer continuous variables
writeRaster(new2012Image, filename = "dinamica/data/croppedModel/inputMaps/cropped2012.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(new2013Image, filename = "dinamica/data/croppedModel/inputMaps/cropped2013.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(new2014Image, filename = "dinamica/data/croppedModel/inputMaps/cropped2014.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalAdmin2, filename = "dinamica/data/croppedModel/inputMaps/finalAdmin2.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalAdmin1, filename = "dinamica/data/croppedModel/inputMaps/finalAdmin1.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalAdmin0, filename = "dinamica/data/croppedModel/inputMaps/finalAdmin0.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalEcoregions, filename = "dinamica/data/croppedModel/inputMaps/finalEcoregions.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalBrazilBiomes, filename = "dinamica/data/croppedModel/inputMaps/finalBrazilBiomes.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalTemperature, filename = "dinamica/data/croppedModel/inputMaps/finalTemperature.tif", datatype = "FLT4S", format = "GTiff",overwrite=TRUE)
writeRaster(finalPrecipitation, filename = "dinamica/data/croppedModel/inputMaps/finalPrecipitation.tif", datatype = "FLT4S", format = "GTiff",overwrite=TRUE)
writeRaster(finalSlope, filename = "dinamica/data/croppedModel/inputMaps/finalSlope.tif", datatype = "FLT4S", format = "GTiff",overwrite=TRUE)
writeRaster(finalElevation, filename = "dinamica/data/croppedModel/inputMaps/finalElevation.tif", datatype = "FLT4S", format = "GTiff",overwrite=TRUE)
writeRaster(finalPopulation, filename = "dinamica/data/croppedModel/inputMaps/finalPopulation.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalProtectedAreas, filename = "dinamica/data/croppedModel/inputMaps/finalProtectedAreas.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalTowns, filename = "dinamica/data/croppedModel/inputMaps/finalTowns.tif", datatype = "INT4S", format = "GTiff",overwrite=TRUE)
writeRaster(finalPorts, filename = "dinamica/data/croppedModel/inputMaps/finalPorts.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalRoads, filename = "dinamica/data/croppedModel/inputMaps/finalRoads.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalRivers, filename = "dinamica/data/croppedModel/inputMaps/finalRivers.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalSlaughterhouses, filename = "dinamica/data/croppedModel/inputMaps/finalSlaughterhouses.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
writeRaster(finalProcessingFacilities, filename = "dinamica/data/croppedModel/inputMaps/finalProcessingFacilities.tif", datatype = "INT2S", format = "GTiff",overwrite=TRUE)
