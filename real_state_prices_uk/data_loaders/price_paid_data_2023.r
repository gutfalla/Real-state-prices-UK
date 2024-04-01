# Set CRAN mirror manually
#options(repos = c(CRAN = "https://cloud.r-project.org"))

# Now install the packages
#install.packages("readr")
#install.packages("lubridate")

# Load required libraries
library(readr)
library(lubridate)

load_data <- function() {
    df <- read.csv(file='http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2023.csv',
    header = TRUE,
    col.names = c("ID", "Price", "Date", "Postcode", "Kind", "Condition", "Estate_type", "PAON", "SAON",
    "Street", "Locality", "Town_City", "District", "County", "A", "A1")
    )
# Parse the 'Date' column using lubridate

    df$Date <- ymd_hm(df$Date)

# Perform transformation
    df <- transform(df)

    df
}