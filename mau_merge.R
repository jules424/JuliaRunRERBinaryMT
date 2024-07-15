library(readxl)
library(dplyr)
library(writexl)

# file paths
# mauR1 <- "~/Desktop/mau_base_raw.csv"
# mauR2 <- "~/Desktop/mau_post_1_raw.csv"

mauR3 <- "~/Desktop/mau_post_2_raw.csv"
mergedBasePost1 <- "~/Desktop/merged_base_post1.csv"

# read excel sheets into data frames
# baseSheet<- read.csv(mauR1)
# raw1Sheet <- read.csv(mauR2)

r2Sheet <- read.csv(mauR3)
 mergedSheet <- read.csv(mergedBasePost1)

mergedBase12 = merge(mergedSheet, r2Sheet, by="SampleID", all=TRUE)
write.csv(mergedBase12, "~/Desktop/merged_base_post1_post2.csv", row.names = FALSE)
