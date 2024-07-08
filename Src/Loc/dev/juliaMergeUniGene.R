# JULIA ALOI, JMA424
  # 26 FEB 2024
  # this will merge unicorn/gene/pheno csv files with the RER output file

library(readr)
library(ggplot2)
library(grafify)
# raw csv RER correlation file 
acuteLophsCorrelationFile = read.csv("Output/AcuteLophsFull/AcuteLophsFullCorrelationFile.csv")

# tsv file for unicorn-ENSG ID relationship
geneCorrelationFile = read.table("Data/unicornOverlap.tsv")

# csv file for tooth gene mutation phenotypes
toothPhenoFile = read.csv("Data/toothCandidateGenes.csv")

names(acuteLophsCorrelationFile)[1] = "unicornsID"
# mergedData = merge(acuteLophsCorrelationFile, geneCorrelationFile, by.x= "unicornsID", by.y= "V8", all.x  = T)
# mergedAcuteLophsWithPheno = merge(mergedData, toothPhenoFile, by.x= "V4", by.y= "ENSG.ID", all.x  = T)
# write.csv(mergedAcuteLophsWithPheno, "Data/mergedAcuteLophs.csv")
mergedAcuteLophsPhenoShortened = read.csv("Data/mergedAcuteLophsShortened.csv")

# VIOLIN PLOT FOR ACUTE LOPHS
guide_axis <- function(title = waiver(), check.overlap = TRUE, angle = NULL, n.dodge = 1,
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

mergedAcuteLophsPhenoShortened$PHENOTYPE <- factor(mergedAcuteLophsPhenoShortened$PHENOTYPE,
                          levels=c("Bud arrest", "Initiation arrest", "Bell arrest", "Abnormal ameloblast",
                                   "No enamel", "Less enamel", "Hyperdontia", "Ectopic elements", "Root malformation", "Other", "Control"))
plot_scatterviolin(data=mergedAcuteLophsPhenoShortened, 
                   xcol=PHENOTYPE,ycol=Rho, 
                   symsize=3,
                   ColPal = "safe")+
  theme_classic()+
  theme(legend.position="none")+
  theme(text = element_text(size=8)) +
  geom_point(shape = NA, color = NA)



ggsave("Output/ToothViolinUpdate.pdf",width=100,height=50)
    plot(ToothViolinUpdate.pdf)
    
