# Healthcare-Data-Analysis-Project-SQL

**1. Project Overview**

This project focuses on analyzing a healthcare admissions dataset to uncover insights related to patient demographics, medical conditions, hospital performance, billing trends, insurance providers, and patient risk factors.
Using SQL (basic to intermediate), the project demonstrates how real-world healthcare data can be cleaned, analyzed, and transformed into actionable business insights.

The analysis emphasizes data quality improvement, cost optimization, operational efficiency, and risk identification, simulating challenges faced by hospitals and insurance providers.


**2. Objective**

Leverage SQL to clean the data and answer business-critical questions that support better decision-making in healthcare operations and cost management.


**3. Dataset Description**

Records: ~10,000 patient admissions

Source: (https://www.kaggle.com/datasets/prasad22/healthcare-dataset)

Key Attributes:

- Patient details: Name, Age, Gender, Blood Type

- Medical data: Medical Condition, Test Results, Medication

- Admission details: Admission Type, Admission Date, Discharge Date, Room Number

- Financial data: Billing Amount, Insurance Provider

- Operational data: Hospital, Doctor


**4. Tools & Skills**

1 - SQL (MySQL)

2 - CTEs

3 - Window Functions and Aggregations 

4 - Data Cleaning & Deduplication

5 - Data Analysis & Business Insight Generation

6 - Problem Solving & Logical Thinking


**5. SQL Problem–Solution Mapping**

| #  | Business Question             | SQL Concepts Used       |
| -- | ----------------------------- | ----------------------- |
| 1  | Total number of patients      | `COUNT(DISTINCT)`       |
| 2  | List medical conditions       | `DISTINCT`              |
| 3  | Average age by gender         | `AVG`, `GROUP BY`       |
| 4  | Admissions by type            | Aggregation             |
| 5  | Billing by insurance provider | `SUM`, `ORDER BY`       |
| 6  | Top medical conditions        | Ranking, `LIMIT`        |
| 7  | Avg billing per condition     | Aggregation             |
| 8  | High-volume hospitals         | `HAVING`                |
| 9  | Emergency admission %         | Conditional aggregation |
| 10 | Billing by gender             | Comparative analysis    |
| 11 | Hospital revenue ranking      | `CTE`, `RANK()`         |
| 12 | Doctor workload analysis      | `COUNT(DISTINCT)`       |
| 13 | High-risk patients            | CTE + filtering         |
| 14 | Duplicate record detection    | `GROUP BY`, `HAVING`    |
| 15 | Deduplication                 | `ROW_NUMBER()`          |


**6. Key Insights**

1 - Emergency admissions consistently show higher average billing than elective cases

2 - A small subset of medical conditions contributes to a disproportionate share of total costs

3 - Hospital revenue is highly concentrated, with a few hospitals driving most billing

4 - Noticeable billing variation across insurance providers for similar treatments

5 - Patients with abnormal test results represent a significant share of high-cost cases


**7. What we achieved**

1 - Improved data accuracy by ~3% by removing 300+ duplicate records from 10,000+ rows

2 - Identified ~50% of total billing driven by the top 3 medical conditions

3 - Revealed 30–40% higher costs for emergency admissions compared to elective cases

5 - Highlighted top 20% hospitals generating ~60% of total revenue

6 - Flagged ~20% high-risk patients (abnormal tests + above-average billing) for focused care and cost control
