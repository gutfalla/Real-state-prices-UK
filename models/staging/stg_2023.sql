with

source as (

    select * from {{ source('staging', '2023') }}

),

renamed as (

    select
        ID,
        Price,
        Selling_date as Selling date,
        Postcode,
        Kind,
        {{ desc_kind(Kind) }} as Estate kind,
        Condition,
        {{ desc_condition(condition) }} as Estate condition,
        Estate_type as Estate type,
        {{ desc_duration(Estate_type) }} as Estate duration,
        PAON,
        SAON,
        Street,
        Locality,
        Town_City,
        District,
        County,
        A,
        {{ desc_a(A) }} as Price paid,
        A1,
        {{ desc_a1(A1) }} as Record status

    from source

)

select * from renamed
