library(ggplot2)
library(dplyr)
# library(tidyr)   # replace_na
# library(tibble)  # column_to_rownames

###
setwd("C:/Users/Alexandra/Documents/Биоинформатика/final_project")
# NAME <- 'H3K36me3_H7.ENCFF063DDB.hg19'
# NAME <- 'H3K36me3_H7.ENCFF063DDB.hg38'
# NAME <- 'H3K36me3_H7.ENCFF864HTI.hg19'
# NAME <- 'H3K36me3_H7.ENCFF864HTI.hg38'
NAME <- 'g4.merged'
OUT_DIR <- 'Results/'

###

bed_df <- read.delim(paste0(NAME, '.bed'), as.is = TRUE, header = FALSE)
# colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.png'), path = OUT_DIR)
