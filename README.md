# Olist E-Commerce: SQL Data Analysis
This is a SQL portfolio project built in **Microsoft SQL Server (SSMS)** using the Brazilian E-Commerce Public Dataset by Olist. 
The project focuses on multi-table relational analysis to uncover insights around logistics performance, customer spending, order cancellations, Month-over-Month (MoM) revenue growth, and customer retention.

---

## Project Overview
The goal of this project is to query a normalized multi-table relational database (`Olist_Ecommerce`) to answer key business questions across operations, revenue trends, and customer behavior.
- **Tools Used:** MS SQL Server (T-SQL), SQL Server Management Studio (SSMS)
- **Tables Analyzed:** `olist_orders_dataset`, `olist_customers_dataset`, `olist_order_items_dataset`, `olist_products_dataset`
- **Dataset Source:** [Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## Repository Structure
```
olist-ecommerce-data-analysis/
├── 01.database_setup/           # Database creation script (Olist_Ecommerce)
├── 02.data_analysis/            # 5 business analysis SQL queries (Q1–Q5)
├── 03.results/                  # Exported CSV outputs for Q1–Q5
└── README.md
```

---

## Business Analysis (`02.data_analysis/`)
The following business questions were answered using multi-table joins, CTEs, window functions (`RANK`, `LAG`), conditional aggregations (`CASE WHEN`), and date calculations:

- **Q1:** What is the average delivery delay (in days) across different customer states?  
  [q1_delivery_delay_by_state.sql](02.data_analysis/q1_delivery_delay_by_state.sql)

- **Q2:** Who are the top 10 highest-spending customers?  
  [q2_top_10_customers_by_spend.sql](02.data_analysis/q2_top_10_customers_by_spend.sql)

- **Q3:** Which top 10 product categories (with 100+ orders) have the highest order cancellation rates?  
  [q3_cancellation_rate_by_category.sql](02.data_analysis/q3_cancellation_rate_by_category.sql)

- **Q4:** How has total revenue grown Month-over-Month (MoM)?  
  [q4_mom_revenue_growth.sql](02.data_analysis/q4_mom_revenue_growth.sql)

- **Q5:** What percentage of unique customers are repeat buyers?  
  [q5_repeat_customer_rate.sql](02.data_analysis/q5_repeat_customer_rate.sql)

---

## Key Business Insights
- **Low Customer Retention:** Out of **93,358** unique delivered customers, only **2,801** placed more than one order - a **3% repeat customer rate**, highlighting a major opportunity for loyalty and re-engagement campaigns.
- **Black Friday Revenue Spike:** Monthly revenue peaked in **November 2017** at **987,765.37**, representing a **+52.37% MoM jump** driven by seasonal demand.
- **Conservative Delivery Estimates:** Negative average delay values across states indicate that orders are frequently delivered ahead of Olist's estimated delivery dates.

---

## Key SQL Techniques Demonstrated
- **Time-Series & Growth Analysis:** `FORMAT`, `DATEDIFF`, `LAG()`, `NULLIF`
- **CTEs & Ranking:** `WITH` clauses, `RANK() OVER (...)`
- **Conditional Aggregation:** `CASE WHEN` inside `SUM()`, `HAVING`, `COUNT(DISTINCT ...)`
- **Relational Querying:** Multi-table `JOIN`s across 4 normalized e-commerce tables

---

## How to Run This Project
1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
2. Run `01.database_setup/01_create_database.sql` in SSMS and import the 4 CSV files into `Olist_Ecommerce`.
3. Execute the scripts in `02.data_analysis/` (Q1–Q5) to reproduce the results in `03.results/`.
