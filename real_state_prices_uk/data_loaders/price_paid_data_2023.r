load_data <- function() {
    df <- read.csv(file='http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2023.csv',
    header = TRUE,
    col.names = c("ID", "Price", "Date", "Postcode", "Kind", "Condition", "Estate_type", "PAON", "SAON",
    "Street", "Locality", "Town/City", "District", "County", "A", "A1")
    )
    df
}