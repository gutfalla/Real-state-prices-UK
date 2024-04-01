![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Untitled.png)

## 1. Introduction

This repository uses data provided by HM Land Registry to explore the distribution of real estate prices in two countries of the United Kingdom. I use the statistical dataset "Price Paid Data" that contains information on the amounts paid for properties in England and Wales. The original file could be accessed at: http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2023.csv

This project was developed using codespaces in all its stages.


![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Mage_VS.gif)


## 2. Methodology

## 2.1 Pipelines

I ran Mage on a docker container for the orchestation. I create a loader for retrieving the data directly from HM Land Registry and submit it to Google Cloud Service (my data lake). The language employed for such task was R.

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/data_loaders/price_paid_data_2023.r

Then, I created a transformer for counting missed values and eliminate them. The language employed was R too.

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/transformers/transform_ppd2023.r

Afterwards, I create a data exporter for sending the transformed data set to BigQuery (my cloud warehouse).

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/data_exporters/export_ppd2023_bigquery.sql

Finaly, I created a trigger for running all the pipeline the 20th of each month at 23:59. The reason is that HM Land Registry update the information at this date and time. I try to guaranty the freshness of the data by doing that.


![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Mage_trigger.png)


## 2.2 Transformation in warehouse

I employed DBT for the developement, test and documentation. I conected DBT to the Big Query database containg all the data generated in the previous pipelines. I developed an schema a some models adding multiple tests to variables as a data engineering good practice. The final schema was: https://github.com/gutfalla/Real-state-prices-UK/blob/main/models/staging/schema.yml .

The query I ran in Big Query was: https://github.com/gutfalla/Real-state-prices-UK/blob/main/models/staging/stg_2023.sql .

A second trigger was added so the freshness of the information in the dashboard is guarantee. The trigger run all the transformations and SQL queries in the data warehouse the 21st of each month at 01:00


![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/DBT.png)


All the documentation can be access at https://cloud.getdbt.com/accounts/254419/develop/6176240/docs/index.html#!/macro/macro.real_state_prices_uk.desc_a .

## 2.3 Dashboard

I employed Goole Lockerstudio for the generation of dashboards for the analysis.

I included in the page 1 a heat map was built with the data of prices. the map does supports zoom and have a controller for filtering by price. It contains other filters, such as county, city, etc.

I included In the page 2 pie charts for the condition of the propierty and the kind of propierty, also a time series with the number of sells per day.

The dashboards can be accessed at: 

https://lookerstudio.google.com/reporting/4654857a-295e-4b0a-9720-47906b0afecd



