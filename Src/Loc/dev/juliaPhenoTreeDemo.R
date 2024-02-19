# JULIA ALOI, JMA424
  # LAST UPDATE: 18 FEB 2024
  # THIS CODE WILL GENERATE A PHENOTYPE TREE FILE 

# load in RER packages
library(RERconverge)
library(tools)
# read in main tree (UNICORNS) with readTrees
toothUnicorns = readTrees("Data/UNICORNsDemo.txt")
# read in phenotype annotation csv
toothPhenotypes = read.csv("Results/ToothData.csv")
# set path for generated pheno tree file
treeOutput = "Output/AcuteLophsDemo.R"
# choose one column 
phenoColumn = "FCT_AL"
# get species from column
relevantSpecies = toothPhenotypes[toothPhenotypes[[phenoColumn]] %in% c(0,1)  ]
relevantSpecies 
# create species filter
speciesFilter = relevantSpecies$


#Now, we need to pick which of the species is in the foreground 
foregroundSpecies = relevantSpecies[ relevantSpecies[[phenotypeColumn]] == 1]

foregroundNames = foregroundSpecies$nameAsItAppearsOnTheTree



binaryPhenotypeTree = foreground2Tree(
  foreground = foregroundNames, 
  treesObj = mainTrees, 
  clade = "all", 
  weighted = F, 
  transition = "bidirectional", 
  useSpecies = speciesFilter
)


#save the tree
saveRDS(binaryPhenotypeTree, treeOutputFile)

#plot the tree to check it 
pdf("output/TestPDF.pdf")
foreground2Tree(
  foreground = foregroundNames, 
  treesObj = mainTrees, 
  clade = "all", 
  weighted = F, 
  transition = "bidirectional", 
  useSpecies = speciesFilter
)
dev.off()


#------ 

mainTrees$mastertrees$tip.label 
#make sure you have a column in your phenotype speadsheet with these for each species 