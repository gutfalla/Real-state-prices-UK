load_data <- function() {
    # Specify your data loading logic here
    # Return value: loaded dataframe
    df <- read.csv(file='http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2023.csv')
    df <- rename(
    Price = X773000,
    Date = X2023.02.02.00.00,
    Postcode = SW1P.4AL,
    Kind = F,
    Condition = N,
    Estate_type = L,
    PAON = GLADSTONE.COURT..97,
    SAON = FLAT.23,
    Street = REGENCY.STREET,
    Locality = X,
    Town_City = LONDON,
    District = CITY.OF.WESTMINSTER,
    County = GREATER.LONDON
  ) 
    df
}
