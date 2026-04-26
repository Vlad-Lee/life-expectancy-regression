# Load libraries
library(tidyverse)

# -----------------------------
# Combine raw data files
# -----------------------------

# Get all CSV files in data folder
files <- list.files("../data/raw", pattern = "\\.csv$", full.names = TRUE)

# Read and reshape each file
df_list <- lapply(files, function(file) {
  var_name <- tools::file_path_sans_ext(basename(file))
  
  read_csv(file, show_col_types = FALSE) %>%
    select(geo, name, `2022`) %>%
    rename(!!var_name := `2022`)
})

# Merge all datasets by country identifiers
df <- reduce(df_list, full_join, by = c("geo", "name"))

# -----------------------------
# Clean data
# -----------------------------

# Check missing values
cat("Missing GDP per capita:", sum(is.na(df$gdp_pcap)), "\n")

# Drop rows with missing GDP per capita
df_clean <- df %>%
  filter(!is.na(gdp_pcap))

# Rename variables for clarity
df_clean <- df_clean %>%
  rename(
    average_daily_income = mincpcap_cppp
  )

# Final checks
cat("Missing GDP per capita after cleaning:", sum(is.na(df_clean$gdp_pcap)), "\n")
cat("Missing life expectancy after cleaning:", sum(is.na(df_clean$lex)), "\n")

# -----------------------------
# Export cleaned dataset
# -----------------------------

dir.create("../data/processed", showWarnings = FALSE)

write_csv(df_clean, "../data/processed/combined_data_2022.csv")