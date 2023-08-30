

def model(dbt, session):

    dbt.config(enabled = True)

    my_sql_model_df = dbt.ref("line_items_with_supp")

    final_df = my_sql_model_df

    return final_df
