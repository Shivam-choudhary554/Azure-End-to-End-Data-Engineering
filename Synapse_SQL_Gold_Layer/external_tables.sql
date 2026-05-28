CREATE DATABASE SCOPED CRENDENTIAL cred_aw
WITH 
	IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
	LOCATION = 'https://awproject12.blob.core.windows.net/silver',
	CRENDENTIAL = cred_aw
)

CREATE EXTERNAL FILE FORMAT Format_parquet
WITH
(
	FORMAT_TYPE = PARQUET,
	DATA_COMPRESSION = 'org.apache.hadoop.in.compress.SnappyCodec'
)

-- CREATE EXTERNAL TABLE EXTSALES

CREATE EXTERNAL TABLE gold.extsales
WITH
(
	LOACTION = 'extsales'
	DATA_SOURCE = 'PARQUET'
	FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales
	