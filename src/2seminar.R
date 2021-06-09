setwd("C:/Users/Alexandra/Documents/Биоинформатика/final_project")

###

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
# 
# BiocManager::install("ChIPseeker", force=TRUE)
# BiocManager::install("clusterProfiler")
# BiocManager::install("org.Hs.eg.db")
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

###

# NAME <- 'H3K36me3_H7.ENCFF864HTI.hg19.filtered'
# NAME <- 'H3K36me3_H7.ENCFF063DDB.hg19'
# NAME <- 'g4.merged'
NAME <- 'exp.g4.intersection'
BED_FN <- paste0(NAME, '.bed')
OUT_DIR <- 'Results/'

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

peak <- readPeakFile(BED_FN)
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.png'))
covplot(peak, weightCol="V5")
dev.off()
