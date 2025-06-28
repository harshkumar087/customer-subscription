# 📉 Customer Churn Analysis Dashboard

An interactive dashboard project that analyzes customer churn behavior and revenue trends using PostgreSQL and Tableau. The dataset was sourced from Kaggle and processed with SQL to extract key business insights on customer retention and subscription revenue.

## 🧰 Tech Stack

- **PostgreSQL** – for structured data storage and SQL querying  
- **Tableau** – for interactive dashboard creation and visualization  
- **Kaggle Dataset** – simulated customer churn data  

## 📌 Project Overview

This project focuses on identifying churn trends and high-value customer segments for a subscription-based service.

### 🔄 Data Workflow

1. **Data Import**  
   - Imported the customer churn dataset from Kaggle into a PostgreSQL database.

2. **SQL Data Modeling**  
   - Created views to calculate **monthly churn rate** segmented by subscription type (`Monthly`, `One-Year`, `Two-Year`).
   - Built additional views to identify:
     - **Top customers** based on total revenue, monthly revenue, and tenure
     - **Top subscription types** contributing to recurring revenue

3. **Visualization in Tableau**  
   - Connected Tableau to the SQL views for live data updates.
   - Developed a dashboard showcasing:
     - Monthly churn trends by subscription type
     - Top-performing customer segments
     - Revenue breakdown and insights

## 📊 Sample Visuals

![Visuals1](https://raw.githubusercontent.com/harshkumar087/customer-subscription/blob/main/Sheet%201-2.png)

![Visuals2](https://raw.githubusercontent.com/harshkumar087/customer-subscription/blob/main/Sheet%202.png)

![Visuals3](https://raw.githubusercontent.com/harshkumar087/customer-subscription/blob/main/Dashboard%201.png)

## 🚀 Features

- Real-time insights via SQL views
- Clear visual breakdown of customer churn
- Business-focused metrics for decision-making
- Scalable structure for real-world datasets
