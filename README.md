# databricks-formula1-project

🏁 Databricks F1 Data Analytics Pipeline with Medallion Architecture

This project demonstrates a modern, cloud-based Formula 1 data analytics workflow built entirely in Python and Databricks notebooks, following the Medallion Architecture pattern. Data is organized into three main folders and catalogs/layers:

- **raw** (Bronze layer): ingestion of unprocessed data
- **processed** (Silver layer): data cleaning and transformation
- **presentation** (Gold layer): aggregation and analytics ready for business consumption

The full workflow leverages Azure Data Lake Storage (ADLS) for scalable cloud storage, Azure Key Vault for secure secrets management, and demonstrates best practices for reproducibility and collaboration.

---

## 1. ⚙️ Initial Setup: Azure Integration and Secret Management

- **Azure Storage**: The project connects to an Azure Data Lake Storage Gen2 account to persist Formula 1 datasets at all architectural layers (raw/processed/presentation).
- **Azure Key Vault**: All sensitive credentials (such as storage access keys and service principal secrets) are retrieved programmatically using Key Vault, ensuring no plaintext secrets reside in notebooks.
- **Mounting Storage**: Databricks notebooks step through mounting ADLS containers and verifying connectivity.

---

## 2. 🥉 Bronze Layer (raw): Ingesting and Storing Raw Data

- Source F1 datasets are ingested from the ADLS **raw** folder.
- Data is read into Databricks using PySpark, stored as raw tables or files.
- Notebooks document how to handle different formats (JSON, CSV, etc.) and initial schema inference.
- Data at this stage remains untransformed, serving as the foundational original layer.

---

## 3. 🥈 Silver Layer (processed): Data Cleaning & Transformation

- Notebooks perform cleaning, normalization, and enrichment on Bronze data, saving results to the ADLS **processed** folder and Silver tables.
- Typical tasks:
    - Standardize column naming conventions.
    - Handle missing values, deduplicate records, and flatten nested structures.
    - Track audit columns (e.g., `ingestion_time`) for lineage.
- All transformation logic is explained step by step, with best practices for distributed processing.

---

## 4. 🏆 Gold Layer (presentation): Business-Ready Analytics

- Final aggregations, metrics, and analytical outputs are written to the ADLS **presentation** folder and Gold tables.
- Example: Calculate the number of race wins per driver using Spark SQL on cleaned Silver data.
- Notebooks focus on extracting insights tailored for decision-makers (leaderboards, statistics, etc.).


---

## 6. ✅ Security & Cloud-Native Best Practices

- Secure access to all external resources using Azure Key Vault integration.
- Credentials and config never hard-coded; all secrets are fetched dynamically.
- Following Databricks and Azure best practices for managed identity and permission delegation.

---

This repository is a practical guide for sports analytics engineers and data scientists who want to build robust, scalable, and secure analytics workflows leveraging Databricks, Python, and Azure cloud-native services.
