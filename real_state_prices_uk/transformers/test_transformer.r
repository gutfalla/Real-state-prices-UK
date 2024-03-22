options(repos = "https://cloud.r-project.org/")
install.packages("dplyr")
library('dplyr')

transform <- function(df_1, ...) {
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
    df_1
}
