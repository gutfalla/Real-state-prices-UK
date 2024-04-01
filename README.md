![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Untitled.png)

## 1. Introduction

This repository uses data provided by the HM Land Registry to explore the distribution of real estate prices in two countries of the United Kingdom. I use the statistical dataset "Price Paid Data" which contains information on the amounts paid for properties in England and Wales. You can access the original file here: http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-2023.csv

I used codespaces in all the stages of this project.


![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Mage_VS.gif)


## 2. Methodology

## 2.1 Pipelines

I ran Mage on a docker container for the orchestration. I create a loader for retrieving the data directly from the HM Land Registry and submit it to Google Cloud Service (my data lake). The language employed for such a task was R.

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/data_loaders/price_paid_data_2023.r

Then, I created a transformer for counting missed values and eliminating them. The language employed was R.

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/transformers/transform_ppd2023.r

Afterwards, I create a data exporter for sending the transformed data set to BigQuery (my cloud warehouse).

https://github.com/gutfalla/Real-state-prices-UK/blob/main/real_state_prices_uk/data_exporters/export_ppd2023_bigquery.sql

Finally, I created a trigger for running all the pipelines on the 20th of each month at 23:59. The reason is that HM Land Registry updated the information at this date and time. I try to guarantee the freshness of the data by doing that.


![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/Mage_trigger.png)


## 2.2 Transformation in warehouse

I employed DBT for the development, testing and documentation. I connected DBT to the Big Query database containing all the data generated in the previous pipelines. I developed a schema adding multiple tests to variables as a data engineering good practice. The final schema was: https://github.com/gutfalla/Real-state-prices-UK/blob/main/models/staging/schema.yml .

The query I ran in Big Query was: https://github.com/gutfalla/Real-state-prices-UK/blob/main/models/staging/stg_2023.sql .

I added a second trigger so the freshness of the information in the dashboard is guaranteed. The trigger runs all the transformations and SQL queries in the data warehouse on the 21st of each month at 01:00


![Alt Text](https://github.com/gutfalla/Real-state-prices-UK/blob/main/DBT.png)


You can access all the documentation at: https://cloud.getdbt.com/accounts/254419/develop/6176240/docs/index.html#!/macro/macro.real_state_prices_uk.desc_a .

## 2.3 Dashboard

I employed Goole Lookerstudio for the generation of dashboards for the analysis.

I included on page 1 a heat map built with the data of prices. The map does support zooming and has a controller for filtering by price. It contains other filters, such as county, city, etc.

I included On page 2 pie charts for the condition of the property and the kind of property, as well as a time series with the number of sales per day.

You can access the dashboards by following the link below: 

https://lookerstudio.google.com/reporting/4654857a-295e-4b0a-9720-47906b0afecd

## Contact

I am established and looking for opportunities in London. If you want to contact me or have more information about my profile, please reach me through LinkedIn.

https://www.linkedin.com/in/hd-falla-gutierrez

Have a nice week!
