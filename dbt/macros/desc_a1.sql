{# 
    This macro returns the description of the A1 on its code.
    A1: A string representing the estate type code.
#}

{#
    This macro returns the description of the additions, changes and deletions to the records.
#}

{% macro desc_a1(A1) -%}

    case {{ dbt.safe_cast("A1", api.Column.translate_type("string")) }}  
        when 'A' then 'Addition'
        when 'C' then 'Change'
        when 'D' then 'Delete'
        else 'EMPTY'
    end

{%- endmacro %}
