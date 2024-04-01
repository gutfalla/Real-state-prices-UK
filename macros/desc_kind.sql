{# 
    This macro returns the description of the kind based on its code.
    kind: A string representing the estate type code.
#}

{#
    This macro returns the description of the property type 
#}

{% macro desc_kind(Kind) -%}

    case {{ dbt.safe_cast("Kind", api.Column.translate_type("string")) }}  
        when 'D' then 'Detached'
        when 'S' then 'Semi-Detached'
        when 'T' then 'Terraced'
        when 'F' then 'Flats/Maisonettes'
        when 'O' then 'Other'
        else 'EMPTY'
    end

{%- endmacro %}
