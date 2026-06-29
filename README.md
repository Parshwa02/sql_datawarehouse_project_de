# 🏗️ Data Warehouse Project with PostgreSQL

This project demonstrates the end-to-end development of a modern data warehouse using **PostgreSQL**, following industry-standard data engineering practices. It covers the complete ETL process—from ingesting raw data to transforming it into an analytics-ready data model using the **Medallion Architecture**.

The project also showcases dimensional modeling techniques and SQL-based analytics to support business intelligence and data-driven decision-making.

---

# 📐 Data Architecture

This project follows the **Medallion Architecture**, organizing data into three distinct layers:

### 🥉 Bronze Layer
- Stores raw data exactly as received from the source systems.
- Data is imported from CSV files into PostgreSQL with minimal transformation.
- Serves as the foundation for all downstream processing.

### 🥈 Silver Layer
- Cleanses, standardizes, and validates the raw data.
- Handles missing values, duplicates, and applies business rules.
- Produces high-quality, consistent datasets for analytical processing.

### 🥇 Gold Layer
- Contains business-ready data modeled using a **Star Schema**.
- Includes dimension and fact views optimized for reporting and analytical queries.
- Serves as the primary layer for dashboards and business intelligence.

---

# 📖 Project Overview

This project demonstrates the following key data engineering concepts:

- **Data Warehouse Design** using the Medallion Architecture.
- **ETL Pipeline Development** for extracting, transforming, and loading data.
- **Data Cleansing & Transformation** to improve data quality and consistency.
- **Dimensional Data Modeling** using fact and dimension tables.
- **SQL-Based Analytics** to generate business insights.

---

# 🚀 Project Requirements

## Data Engineering

### Objective

Build a modern data warehouse in PostgreSQL that consolidates CRM and ERP sales data into a centralized repository optimized for reporting and analytics.

### Specifications

- Import data from two source systems (**CRM** and **ERP**) provided as CSV files.
- Perform data cleansing and resolve data quality issues during the ETL process.
- Integrate both sources into a unified analytical data model.
- Design the warehouse using the Medallion Architecture.
- Create fact and dimension models for efficient analytical queries.
- Focus on the latest available data; historical tracking is not included.

---

## 📊 Analytics & Reporting

### Objective

Develop SQL-based analytical queries to generate meaningful business insights in the following areas:

- 👥 Customer Behavior
- 📦 Product Performance
- 💰 Sales Performance
- 📈 Sales Trends

These insights help stakeholders monitor key business metrics and support data-driven decision-making.

---

# 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL
- **Architecture:** Medallion Architecture
- **Data Modeling:** Star Schema
- **Source Data:** CSV Files
- **Version Control:** Git & GitHub

---

# 📂 Repository Structure

```text
data-warehouse-project/
│
├── datasets/                      # Raw CRM and ERP datasets
│
├── scripts/
│   ├── bronze/                    # Raw data ingestion scripts
│   ├── silver/                    # Data cleansing and transformation scripts
│   └── gold/                      # Star schema and analytical view scripts
│
├── README.md                      # Project documentation
└── LICENSE                        # MIT License
```

---

# ⚙️ Project Workflow

```text
           CSV Files
               │
               ▼
      ┌─────────────────┐
      │  Bronze Layer   │
      │   Raw Data      │
      └─────────────────┘
               │
               ▼
      ┌─────────────────┐
      │  Silver Layer   │
      │ Clean & Transform│
      └─────────────────┘
               │
               ▼
      ┌─────────────────┐
      │   Gold Layer    │
      │ Star Schema     │
      └─────────────────┘
               │
               ▼
     Reports & Analytics
```

---

# 📌 Key Features

- End-to-end ETL pipeline
- Layered Medallion Architecture
- Data cleansing and validation
- Standardized business-ready datasets
- Star Schema data modeling
- SQL stored procedures for ETL
- Analytical views for reporting
- Modular SQL scripts for easy maintenance

---

# 🛡️ License

This project is licensed under the **MIT License**.

Feel free to use, modify, and share this project with proper attribution.
