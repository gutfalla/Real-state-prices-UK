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
        {{ desc_kind(Kind) }} as Estate_kind,
        Condition,
        {{ desc_condition(condition) }} as Estate_condition,
        Estate_type,
        {{ desc_duration(Estate_type) }} as Estate_duration,
        PAON,
        SAON,
        Street,
        Locality,
        Town_City,
        District,
        County,
        A,
        {{ desc_a(A) }} as Price_paid,
        A1,
        {{ desc_a1(A1) }} as Record_status

    from source

)

select * from renamed
