{# 
    This macro returns the description of the Condition based on its code.
    Condition: A string representing the estate type code.
#}

{#
    This macro returns the description of the property condition 
#}

{% macro desc_condition(Condition) -%}

    case {{ dbt.safe_cast("Condition", api.Column.translate_type("string")) }}  
        when 'Y' then 'New'
        when 'N' then 'Pre-owned'
        else 'EMPTY'
    end

{%- endmacro %}
