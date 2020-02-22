#### ---- Project: Shiny Adventure -----
#### ---- Task: Script to download data ----
#### ---- By: Steve and Mesi ----
#### ---- Date: 2019 Dec 14 (Sat) ----

#### ---- Setup ----
#library(dplyr)

# Data url
df_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/cmc/cmc.data"

# Names url
names_url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/cmc/cmc.names"

# Downloading data and names
df <- read.csv(df_url)
names_labs <- read.csv(names_url, sep = "\t")
names_df <- data.frame(names_labs)
names(names_df) <- "labels"
names_df$pos <- 1:nrow(names_df)
get_pos <- grep("Attribute Information", names_df$labels)
names_df <- names_df[names_df$pos %in% c((get_pos+1):(nrow(names_df)-1)), ]

names_df$labs_clean <- gsub("\\(.*", "", names_df$labels)
names_df$labs_clean <- gsub(".*\\.","", names_df$labs_clean)
names_df$labs_clean <- tolower(names_df$labs_clean)
names_df$labs_clean <- gsub("'", "",names_df$labs_clean)
names_df$labs_clean <- gsub("\\?", "",names_df$labs_clean)
names_df$labs_clean <- trimws(names_df$labs_clean,which = c("both", "left", "right"))
names_df$labs_clean <- gsub(" ", "_",names_df$labs_clean)
names_df$labs_clean <- gsub("-", "_",names_df$labs_clean)
