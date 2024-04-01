![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Untitled.png)

## 1. Introduction

This repository uses data provided by HM Land Registry to explore the distribution of real estate prices in two countries of the United Kingdom. I use the statistical dataset "Price Paid Data" that contains information on the amounts paid for properties in England and Wales. The original file could be accessed at: http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2023.csv

This project was developed using codespaces in all its stages.

![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Mage_VS.gif)

## 2. Methodology

## 2.1 Pipeline

I ran Mage on a docker container. I create a loader for retrieving the data directly from HM Land Registry and submit it to Google Cloud Service (my data lake). The language employed for such task was R.

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/data_loaders/price_paid_data_2023.r

Then, I created a transformer for counting missed values and eliminate them. The language employed was R too.

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/transformers/transform_ppd2023.r

Afterwards, I create a data exporter for sending the transformed data set to BigQuery (my cloud warehouse).

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/data_exporters/export_ppd2023_bigquery.sql

Finaly, I created a trigger for running all the pipeline the 20th of each month at 23:59. The reason is that HM Land Registry update the information at this date and time. I try to guaranty the freshness of the data by doing that.

![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Mage_trigger.png)















The dashboard can be accesed following this link:

## Dashboard

<iframe src="https://lookerstudio.google.com/embed/reporting/4654857a-295e-4b0a-9720-47906b0afecd/page/XK5uD" width="800" height="600"></iframe>



