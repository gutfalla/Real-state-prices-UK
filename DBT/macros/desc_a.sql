{# 
    This macro returns the description of the A on its code.
    A: A string representing the estate type code.
#}

{#
    This macro returns the description of the type of Price Paid in the transaction.
#}

{% macro desc_a(A) -%}

    case {{ dbt.safe_cast("A", api.Column.translate_type("string")) }}  
        when 'A' then 'Standard Price Paid'
        when 'B' then 'Additional Price Paid'
        else 'EMPTY'
    end

{%- endmacro %}
