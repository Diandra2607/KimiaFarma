# Background
PT Kimia Farma Tbk is the first pharmaceutical industry company in Indonesia, founded by the Dutch East Indies Government in 1817 under the name NV Chemicalien Handle Rathkamp & Co.
After the nationalization of Dutch companies in 1958, the company became the State Pharmaceutical Company Bhinneka Kimia Farma. On August 16, 1971, its status was changed to a limited liability company under the name PT Kimia Farma (Persero). On July 4, 2001, the company became a public company by listing its shares on the Jakarta Stock Exchange and the Surabaya Stock Exchange. In 2020, Kimia Farma became part of the state-owned pharmaceutical holding company under PT Bio Farma (Persero).
Kimia Farma has various business lines, including pharmaceutical production, distribution and trading, as well as pharmaceutical retail services through a network of pharmacies and health clinics spread throughout Indonesia.

# Data Preprocessing
The first thing to do is to a data preprocessing. The first step is to import all four tables which are needed, consisted of product, branch, inventory, and final transaction. After that, check those tables if they have missing values. Because all of four tables don't have missing values, so the next step is create a new table using inner join from all four tables.

# Average Price by Product Category
![image](https://github.com/user-attachments/assets/d698b145-72ea-4768-a08b-0ee1fd3e8f08)

M01AB is the product category with highest average price with average price of 609344.42933260766 while the N05C ist the product category with lowest average price with average price of 441123.34516915068.

# Average Transaction by Year
![image](https://github.com/user-attachments/assets/b6920ce0-86c4-4889-bf1b-6629c9cfafde)

2023 is the year with the highest average transactions with 478507.1 transactions, and 2020 is the year with the lowest average transactions which are 476959.56 transactions.
If people look at the data, the average transactions by year are shown to be increased.

# Total Transaction by Product Category
![image](https://github.com/user-attachments/assets/2fe2025d-6629-4107-89a4-e152e15bdc8d)

The product category with highest total transactions is N05C with 484687 transactions and the product category with lowest total transaction is N02BA with 213937 transactions. 

# Branches with Highest Branch Rating but Lowest Transaction Rating
![image](https://github.com/user-attachments/assets/40f07474-9ad2-4c1c-90ae-b9c4807c7f89)

Based on the analysis with Google BigQuery, East Nusa Tenggara, North Sumatera, East Java, and West Java are the branches with highest branch rating but lowest transaction rating.

# Total Transactions by Province
![image](https://github.com/user-attachments/assets/aac021cf-a7fc-4a04-839f-8a20655ff4bb)

The province with highest total transactions is West Java, with 793504 transactions and the province with lowest total transactions is West Papua, with 17082 transactions.

# Total Profit by Province
![image](https://github.com/user-attachments/assets/042a70a2-6f2f-46f8-b787-c4df42c71e19)

The province with highest total transactions is West Java, with with a profit of 107481660404.39984 and the province with lowest total transactions is West Papua,with a profit of 2277058442.8500009.

# Total Profit by Year
![image](https://github.com/user-attachments/assets/e52b09d1-ecce-4b22-8e91-afda617daf4a)

2020 is the year with the highest total profit with profit of 321990632202.0, and 2021 is the year with the lowest average transactions with profit of 320017536019.0.
If people look at the data, the total profit by year are shown to be fluctuated.

# Insights
1. Profitability Analysis: Conduct a deeper dive into the factors influencing profit fluctuations. Analyze cost of goods sold, operating expenses, and pricing strategies for each product category. This will help identify areas for cost optimization and revenue enhancement.
2. Product Portfolio Optimization: Review the pricing and volume strategies for different product categories. Consider adjusting pricing for M01AB to maximize revenue, while ensuring competitive pricing for high-volume categories like N05C. Investigate the potential for expanding the product portfolio in high-growth areas.
3. Geographic Focus: Develop targeted strategies for different provinces based on their market dynamics. For West Java, focus on maintaining market share and optimizing operations. For West Papua and other low-performing regions, explore opportunities for growth, potentially through targeted marketing campaigns, improved distribution networks, or strategic partnerships.
4. Branch Performance Improvement: Prioritize investigating the discrepancy between branch rating and transaction rating. Conduct customer surveys, staff interviews, and operational audits to identify specific areas for improvement. Implement targeted training programs, optimize inventory management, and address any pricing or service issues.
5. Data-Driven Decision Making: Leverage data analytics to continuously monitor key performance indicators and identify emerging trends. Develop predictive models to forecast demand and optimize inventory levels. Implement a robust reporting system to track progress and measure the impact of implemented strategies.













