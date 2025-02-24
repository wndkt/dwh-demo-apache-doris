# Building an End to End Data Warehouse Solution with Apache Doris

This repository showcases the complete process of building a Data Warehouse (DWH) and Business Intelligence (BI) dashboard using Apache Doris, Apache Hop, and Metabase.

## Youtube Demo :
	https://www.youtube.com/watch?v=ldeGZiLl0uc&t=43s

## Demo Overview

1. **Mapping & Business Analysis**  
   Identify key business questions and reporting needs before building the DWH.

2. **DDL Staging & Dimensional Model**  
   Define and execute the DDL schema in Apache Doris.

3. **Data Ingestion**  
   Load data into staging tables using a bulkload script.

4. **ETL Pipeline**  
   Perform data cleaning, deduplication, aggregation, and transformation using Apache Hop.

5. **Dashboard & Reporting**  
   Build interactive dashboards and reports for business users with Metabase.

## Technologies Used
- **Apache Doris** – High-performance analytical database
- **Apache Hop** – ETL tool for data transformation
- **Metabase** – Business Intelligence and reporting

# All Document

## Mapping Staging & MIS Model : 
	- Doc/Demo-ApacheDoris-DWH-Mapping.xlsx

## Slides Presentation : 
	- Doc/"Apache Doris -Building an End-to-End Data Warehouse Solution.pptx"

## ETL on Apache Hop:
	- ETL/demoDoris

## Apache Doris DDL:
	- Script/DDL_Staging.sql
	- Script/DDL_Dimensional.sql

## SQL & Shell Script:
	- Script/ETL_Populate_Model.sql
	- Script/ETL_Bulkload_Script.sh
	- Script/Netflix.sql

## Study Case Report & Dashboard :
	- Script/reportTestCase.txt

## Data Sample :
	- Sample/Netflix100k.txt

## Metabase Dashboard :
	- Dashboard/"Dashboard - Summary Order.pdf"

**Contributions & Feedback**  
Feel free to contribute, raise issues, or share feedback!
