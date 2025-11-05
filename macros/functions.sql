{% macro margin_percent(column_name1,column_name2,rounding=2)%}

ROUND(SAFE_DIVIDE({{column_name1}},{{column_name2}})*100,{{rounding}})

{% endmacro %}