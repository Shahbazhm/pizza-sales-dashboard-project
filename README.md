# 🍕 Pizza Sales Analysis Dashboard | Power BI + SQL Server

## 📌 Project Overview
This project is an end-to-end Pizza Sales Analysis Dashboard developed using **SQL Server** and **Power BI**.  
The goal of the project was to transform raw transactional data into meaningful business insights through data modeling, SQL analysis, DAX calculations, and interactive dashboard design.

The dashboard provides a comprehensive overview of:
- Sales performance
- Customer ordering trends
- Best & worst selling pizzas
- Revenue analysis
- Interactive drill-through exploration

---

# 🛠️ Tools & Technologies Used

- **SQL Server**
  - Data loading
  - Query development
  - KPI validation
  - Business analysis

- **Power BI**
  - Data modeling
  - Power Query transformations
  - DAX measures & calculations
  - Dashboard design & interactivity

- **CSV Dataset**
  - Flat file data source

---

# 📂 Project Workflow

## 1️⃣ Data Loading & Database Creation
- Imported raw CSV dataset into SQL Server
- Used SQL scripts for:
  - Table creation
  - Data loading
  - Data validation

---

## 2️⃣ SQL Analysis
Developed SQL queries to analyze:
- Total revenue
- Total orders
- Pizza quantities sold
- Sales trends
- Best & worst performing pizzas

SQL was also used to cross-check Power BI calculations for accuracy.

---

## 3️⃣ Power BI Data Modeling
- Connected Power BI with SQL Server
- Performed data cleaning and transformation using Power Query
- Created:
  - Calculated columns
  - Measures
  - Time intelligence calculations

---

## 4️⃣ Dashboard Development
Designed a multi-page interactive dashboard including:

### 🏠 Home Dashboard
Provides high-level business overview:
- Total Revenue
- Average Order Value
- Total Orders
- Total Pizzas Sold
- Daily & Monthly Sales Trends
- Sales by Category
- Sales by Pizza Size

---

### 📊 Best/Worst Sellers Dashboard
Analyzes product performance:
- Top 5 Pizzas by Revenue
- Top 5 Pizzas by Quantity
- Top 5 Pizzas by Orders
- Bottom 5 performers across all metrics

---

### 🔍 Pizza Detail Analysis (Drill-Through Page)
Interactive drill-through page allowing users to:
- Explore detailed performance of individual pizzas
- Analyze monthly revenue trends
- View sales distribution by size
- Evaluate quantity contribution by category

---

# 🚀 Key Features & Enhancements

## ✅ Time Intelligence
- Month-over-Month (MoM) Revenue Growth
- Dynamic KPI enhancement
- Average benchmark line added to trend analysis

---

## ✅ Interactive Drill-Through Analysis
- Right-click navigation from Best/Worst Seller visuals
- Dynamic detailed pizza-level analysis page
- Improved report interactivity and exploration

---

## ✅ Dashboard UX Improvements
- Dynamic page titles
- Navigation buttons between pages
- Improved visual hierarchy
- Cleaner analytical storytelling
- Enhanced chart formatting and readability

---

# 📈 Key Business Insights

- 📅 Orders are highest during weekends, especially Friday & Saturday evenings
- 📈 Sales peak during January and July
- 🍕 Classic category contributes the highest revenue and orders
- 📦 Large-size pizzas generate maximum sales
- 📉 Certain pizzas consistently underperform across revenue, quantity, and order metrics

---

# 📸 Dashboard Preview

## 🏠 Home Dashboard
![Home Dashboard](images/home_dashboard.png)

---

## 📊 Best/Worst Sellers Dashboard
![Best Worst Dashboard](images/best_worst_dashboard.png)

---

## 🔍 Pizza Detail Analysis
![Drill Through Dashboard](images/pizza_detail_analysis.png)

---

# 📁 Repository Structure

```text
pizza-sales-dashboard-project/
│
├── data/
│   └── pizza_sales.csv
│ 
├── docs/
│   ├──  measures_dax.txt
│   └──  pizza_sales_data_dictionary.md
│
├── images/
│   ├── pizza_sales_dashboard_3.png
│   ├── pizza_sales_dashboard_4.png
│   ├── pizza_sales_dashboard_5.png
│   └── project_architecture_diagram.png
├── powerbi/
│   └── pizza_sales_dashboard_1.pbix
│
├── sql/
│    ├── staging/ 
│       ├── ddl_staging.sql
│       └── pro_load_staging.sql
│    ├── final/ 
│       ├── ddl_final.sql
│       └── pro_load_final.sql
│   ├── PIZZA SALES SQL QUERIES_1.docx
│   └── init_database.sql
└── README.md
```

---

# ▶️ How to Use

1. Clone this repository
2. Open SQL scripts in SQL Server
3. Load dataset into SQL Server
4. Open `.pbix` file in Power BI Desktop
5. Refresh data connection if required

---

# 📚 Skills Demonstrated

- SQL Query Writing
- Data Validation
- Data Modeling
- DAX Calculations
- Time Intelligence
- Power BI Dashboard Design
- Interactive Reporting
- Business Insight Generation

---

# 📎 Dataset Source
Dataset sourced from Kaggle for educational and portfolio purposes.

---

# 👤 Author

**Shahbaz**  
Data Analytics Enthusiast | SQL | Power BI | Data Visualization
