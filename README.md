# Azure End-to-End Data Engineering Project

## 📌 Project Overview
I built this project to showcase a complete, scalable data pipeline using the Azure cloud stack. It pulls raw e-commerce data (the AdventureWorks dataset) from a GitHub API, processes it through various layers of refinement, and feeds it into a Power BI dashboard for business reporting. 

The main goal was to build a realistic, automated ETL pipeline that handles everything from dynamic data ingestion to final business intelligence reporting.

## 🛠️ Tech Stack
This project leverages the following tools:
* **Orchestration:** Azure Data Factory (ADF) to build dynamic, parameterized pipelines.
* **Storage:** Azure Data Lake Storage (ADLS Gen2) for scalable cloud storage[cite: 1].
* **Transformation:** Azure Databricks (PySpark) to process and clean the data[cite: 1].
* **Data Warehousing:** Azure Synapse Analytics (Serverless SQL Pools) to build secure reporting views[cite: 1].
* **Business Intelligence:** Power BI to build the final interactive dashboard[cite: 1].

## 🏗️ The Medallion Architecture
To keep the data organized and optimized, I used the Medallion Architecture to move data through three distinct zones:

### 🥉 Bronze Layer (Raw Data)
This layer contains the raw data exactly as it comes from the source[cite: 1]. Using Azure Data Factory, I set up a dynamic `ForEach` loop to pull CSV files (Sales, Customers, Products, etc.) from the GitHub API and dump exact replicas into the Bronze container in ADLS Gen2[cite: 1].

### 🥈 Silver Layer (Transformed Data)
This is where the heavy lifting happens. I mounted the Data Lake to Azure Databricks and used PySpark to clean and transform the raw data[cite: 1]. This included fixing timestamp formats, standardizing strings, and applying business logic. The cleaned data was then written back to the Silver container as optimized **Parquet** files.

### 🥇 Gold Layer (Serving Data)
This layer is optimized for reporting and serving the stakeholders[cite: 1]. Using Serverless SQL Pools in Azure Synapse Analytics, I structured the cleaned data into a Star Schema. I wrote `OPENROWSET` and `CETAS` queries to create secure views and external tables, making the data instantly queryable and ready for Power BI.

## 📊 Final Power BI Dashboard

<img width="1168" height="655" alt="image" src="https://github.com/user-attachments/assets/3b7b56fc-2442-4430-9490-28bd15bb7924" />

## 💡 Key Takeaways
* **Dynamic over Static:** By parameterizing the ADF pipelines, the ingestion process is future-proofed. If new tables are added to the source, the pipeline handles them automatically without requiring new copy activities.
* **Cost & Performance:** Storing data as Parquet files and querying it via Synapse Serverless SQL is significantly faster and cheaper than loading everything into a traditional, dedicated SQL database.

---
**Author:** Shivam Kumar Chaudhary  
[LinkedIn](https://linkedin.com/in/shivam-kumar-choudhary-8741a9211) | [GitHub](https://github.com/Shivam-choudhary554)
