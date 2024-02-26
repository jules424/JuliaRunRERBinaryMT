# DENTAL MORPH PROJ
  # @author: jma424
  # this will correct the species format in dental morph data to match UNICORNs format
  # last update: 10 FEB 2024

toothData = read.csv("Data/ZliobaiteDentalData.csv")
toothData$FaName = toothData$TAXON
toothData$FaName = sub(" ", "_", toothData$FaName)
write.csv(toothData, "Results/ToothData.csv")

length(which(toothData$FCT_AL == 1))
saveRDS(mainTrees, "Data/UNICORNsDemo.rds")
length(mainTrees$masterTree$tip.label)
length(toothData$FaName)
pathsObject

saveRDS(mainTrees, "Data/toothUnicornsMasterTree.rds")









length(which(!mainTrees$masterTree$tip.label %in% toothData$FaName))
length(mainTrees$masterTree$tip.label)
length(phenotypeTree$tip.label)
speciesFilter[speciesFilter %in% mainTrees$masterTree$tip.label]
length(mainTrees$trees$UNICORN_100282$tip.label)




# WYNN MEETING 2/23
??plotRers
# figure out shift overall between UNICORNS and genome wide test statistics

# DOWNLOAD Q VALUE PACKAGE 
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("qvalue")