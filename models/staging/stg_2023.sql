with

source as (

    select * from {{ source('staging', '2023') }}

),

renamed as (

    select
        ID,
        Price,
        Selling_date,
        Postcode,
        Kind,
        Condition,
        Estate_type,
        PAON,
        SAON,
        Street,
        Locality,
        Town_City,
        District,
        County,
        A,
        A1

    from source

)

select * from renamed
