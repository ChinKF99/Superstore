# Superstore

>>>Progress
## 2 March 2026 ##
-Use python pandas library to replace "," with empty string in the product_name column to load into SQL
-Create & update bronze layer DDL scripts.
    -ddl_bronze_table_create.sql
    -ddl_bronze_lod.sql

## 12 March 2026##
-Use SQL to create SCHEMA silver
-Use SQL to create and load data to 3 tables: silver.customer_detail;, silver.product_detail

## 13 March 2026##
-Use SQL to create gold_sales_fact



>>> Problem Encounter and how to solve:

{Python{:-
## 2 March 2026 ##
1. Moving python venv file from 1 path to another, error in using pip. Solve by deleting venv file and recreating it.
2. Error when trying to execute "df = pd.read_csv('your_file.csv')" use chatgpt and solve it by specfying the encoding. Default encoding is UTF-8, change to encoding=latin1.
Final code: df = pd.read_csv('Project_1_superstore/superstore.csv', encoding='latin1')

{SQL{:-
## 2 March 2026 ##
1. Trying to load superstore.csv file into SQL. Unable to load due do "," bein use in [product_name] column other than field delimiter. Solve by using python pandas library to replace "," with empty string in that column.

## 12 March 2026##
1. Getting multiple repeated values of customer_id for silver.customer_detail. Solve by using DISTINCT function in sql when loading.
2. Using SELECT & INTO function to create silver layer table and load it's data.

## 13 March 2026##
1. Using SUM function to find total sales, however can't work new column required a name.
2. Left join not working, fix by making sure FROM [MAIN TABLE] LEFT JOIN [SUB TABLE] ON [CONDITION]. Tips, use alias name for table name to shorten the syntax.



