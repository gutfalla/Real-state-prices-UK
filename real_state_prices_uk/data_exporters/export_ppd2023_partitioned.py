# Import libraries
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import os

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os. environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/lexical-theory-410512-cb03a80ef9a1.json"

bucket_name = 'real_estate_prices_uk'
project_id = 'lexical-theory-410512'

table_name = "price_paid_data_2023_daily"

root_path = f'{bucket_name}/{table_name}'

@data_exporter
def export_data(data, *args, **kwargs):
    # Convert 'Date' column to datetime if needed
    data['Date'] = pd.to_datetime(data['Date'])
    
    # Extract date part from 'Date' column
    data['Date'] = data['Date'].dt.date

    # Convert DataFrame to PyArrow Table
    table = pa.Table.from_pandas(data)

    # Initialize Google Cloud Storage filesystem
    gcs = pa.fs.GcsFileSystem()

    # Write Parquet dataset to GCS
    pq.write_to_dataset( 
        table,
        root_path=root_path,
        partition_cols=['Date'],
        filesystem=gcs
    )
