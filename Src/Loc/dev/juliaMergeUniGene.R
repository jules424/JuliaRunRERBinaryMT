# JULIA ALOI, JMA424
  # 26 FEB 2024
  # this will merge unicorn/gene/pheno csv files with the RER output file

# raw csv RER correlation file 
acuteLophsCorrelationFile = read.csv("Output/AcuteLophsFull/AcuteLophsFullCorrelationFile.csv")

# tsv file for unicorn-ENSG ID relationship
geneCorrelationFile = read.table("Data/unicornOverlap.tsv")

# csv file for tooth gene mutation phenotypes
toothPhenoFile = read.csv("Data/toothCandidateGenes.csv")

names(acuteLophsCorrelationFile)[1] = "unicornsID"
mergedData = merge(acuteLophsCorrelationFile, geneCorrelationFile, by.x= "unicornsID", by.y= "V8", all.x  = T)
mergedAcuteLophsWithPheno = merge(mergedData, toothPhenoFile, by.x= "V4", by.y= "ENSG.ID", all.x  = T)

# VIOLIN PLOT FOR ACUTE LOPHS
library(readr)
library(ggplot2)
library(grafify)
#Grafify requires the following non-exported function from ggplot2:
#(obtained from here: https://github.com/tidyverse/ggplot2/blob/master/R/guides-axis.r)
guide_axis <- function(title = waiver(), check.overlap = FALSE, angle = NULL, n.dodge = 1,
                       order = 0, position = waiver()) {
  structure(
    list(
      title = title,
      
      # customizations
      check.overlap = check.overlap,
      angle = angle,
      n.dodge = n.dodge,
      
      # general
      order = order,
      position = position,
      
      # parameter
      available_aes = c("x", "y"),
      
      name = "axis"
    ),
    class = c("guide", "axis")
  )
}

plot_scatterviolin(data=mergenew, xcol=Type, ycol=AUC, 
                   symsize=3,
                   ColPal = "safe")+
  theme_classic()+
  theme(legend.position="none")+
  theme(text = element_text(size=20))


ggsave("DietGeneViolin.pdf",width=12,height=7)



mergedAcuteLophsWithPheno$Rho <- as.factor(mergedAcuteLophsWithPheno$Rho)
head(mergedAcuteLophsWithPheno)
library(ggplot2)
# Basic violin plot
violinAcuteLophs <- ggplot(mergedAcuteLophsWithPheno, aes(x=Rho, y=GENE)) + 
  geom_violin()
violinAcuteLophs
# Rotate the violin plot
p + coord_flip()
# Set trim argument to FALSE
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_violin(trim=FALSE)