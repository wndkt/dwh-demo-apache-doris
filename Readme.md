# Building an End to End Data Warehouse Solution with Apache Doris

This repository showcases the complete process of building a Data Warehouse (DWH) and Business Intelligence (BI) dashboard using Apache Doris, Apache Hop, and Metabase.

## Youtube Demo :
https://www.youtube.com/watch?v=ldeGZiLl0uc&t=43s

![Alt text](https://github.com/wndkt/dwh-demo-apache-doris/blob/main/Image/headline.png "Demo")

![Alt text](https://github.com/wndkt/dwh-demo-apache-doris/blob/main/Image/live.png "Demo")

## Slides Presentation : 
	- Doc/"Apache Doris -Building an End-to-End Data Warehouse Solution.pptx"

## Demo Overview

![Alt text](https://github.com/wndkt/dwh-demo-apache-doris/blob/main/Image/dwh-techstack.png "DWH - Tech Stack")

1. **Mapping & Business Analysis**  
   Identify key business questions and reporting needs before building the DWH.

   ## Mapping Staging & MIS Model : 
	- Doc/Demo-ApacheDoris-DWH-Mapping.xlsx

2. **DDL Staging & Dimensional Model**  
   Define and execute the DDL schema in Apache Doris.

  	## Apache Doris DDL:
	- Script/DDL_Staging.sql
	- Script/DDL_Dimensional.sql

3. **Data Ingestion**  
   Load data into staging tables using a bulkload script.

   ## SQL & Shell Script:
	- Script/ETL_Populate_Model.sql
	- Script/ETL_Bulkload_Script.sh
	- Script/Netflix.sql

	## Data Sample :
	- Sample/Netflix100k.txt

4. **ETL Pipeline**  
   Perform data cleaning, deduplication, aggregation, and transformation using Apache Hop.

   ## ETL on Apache Hop:
	- ETL/demoDoris

5. **Dashboard & Reporting**  
   Build interactive dashboards and reports for business users with Metabase.

   ## Metabase Dashboard :
	- Dashboard/"Dashboard - Summary Order.pdf"

	## Data Sample :
	- Sample/Netflix100k.txt

## Technologies Used
- **Apache Doris** – High-performance analytical database

![Alt text](https://github.com/wndkt/dwh-demo-apache-doris/blob/main/Image/doris.png "DB - Apache Doris")

- **Apache Hop** – ETL tool for data transformation

![Alt text](https://github.com/wndkt/dwh-demo-apache-doris/blob/main/Image/hop.png "ETL - Apache Hop")

- **Metabase** – Business Intelligence and reporting

![Alt text](https://github.com/wndkt/dwh-demo-apache-doris/blob/main/Image/metabase.png "Report & Dashboard - Metabase")

**Contributions & Feedback**  
Feel free to contribute, raise issues, or share feedback!

**Contact**
- Linkedin - https://www.linkedin.com/in/wandhanakurnia/
- Youtube - https://www.youtube.com/@wndktech
- Email: wandhanak@gmail.com