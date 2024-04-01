{# 
    This macro returns the description of the Estate_type based on its code.
    Estate_type: A string representing the estate type code.
#}

{#
    This macro returns the description of the property duration (tenure)
#}

{% macro desc_duration(Estate_type) -%}

    case {{ dbt.safe_cast("Estate_type", api.Column.translate_type("string")) }}  
        when 'F' then 'Freehold'
        when 'L' then 'Leasehold'
        else 'EMPTY'
    end

{%- endmacro %}
