transform <- function(df_1, ...) {
    # Count NA values
    na_count <- colSums(is.na(df_1))
    print("NA counts before elimination:")
    print(na_count)
    
    # Remove rows with NA values
    df_1 <- na.omit(df_1)
    
    # Count NA values after elimination
    na_count_after <- colSums(is.na(df_1))
    print("NA counts after elimination:")
    print(na_count_after)

    df_1
}
