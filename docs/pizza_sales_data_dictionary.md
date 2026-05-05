# 🍕 Pizza Sales Data Dictionary

This document defines the structure, fields, and business meaning of the dataset used in the Pizza Sales Analysis project. It covers the **source SQL table** and the **derived Power BI model (Date table + key measures)**.

---

# 📁 1) Source Table: `pizza_sales` (SQL Server)

**Grain:** One row per pizza item within an order (line-item level).

| Column Name | Data Type | Description | Example |
|---|---|---|---|
| pizza_id | INT | Unique identifier for each pizza record (line item). | 10123 |
| order_id | INT | Identifier for the order. Multiple rows can share the same order_id. | 5001 |
| pizza_name_id | VARCHAR(50) | Internal identifier for the pizza (SKU-style). | bbq_ckn_l |
| quantity | INT | Number of pizzas ordered in this line item. | 2 |
| order_date | DATE | Date when the order was placed. | 2015-07-14 |
| order_time | TIME | Time when the order was placed. | 18:35:22 |
| unit_price | DECIMAL(10,2) | Price of a single pizza unit. | 12.50 |
| total_price | DECIMAL(10,2) | Total price for the line item (quantity × unit_price). | 25.00 |
| pizza_size | VARCHAR(5) | Size of the pizza. | L, M, S |
| pizza_category | VARCHAR(50) | Category of the pizza. | Classic, Supreme |
| pizza_ingredients | VARCHAR(500) | List of ingredients for the pizza. | Chicken, BBQ Sauce |
| pizza_name | VARCHAR(50) | Display name of the pizza. | BBQ Chicken Pizza |

---

# 📅 2) Derived Table: `DateTable` (Power BI)

**Purpose:** Enables time intelligence analysis (MoM growth, trends, running totals).

| Column Name | Description |
|---|---|
| Date | Continuous date column linked to `pizza_sales[order_date]` |
| Month Name | Short month label (Jan, Feb, etc.) |
| Month Number | Numeric month (1–12) used for sorting |
| Year | Year extracted from date |
| Year-Month | Combined key for chronological sorting (YYYY-MM) |

---

# 🧮 3) Calculated Columns (Power BI)

```DAX
Order Day = UPPER(LEFT(pizza_sales[Day Name], 3))
```

```DAX
Order Month = UPPER(LEFT(pizza_sales[Month Name], 3))
```

**Purpose:**
- Standardizes day/month labels (e.g., MON, TUE, JAN, FEB)
- Improves readability and consistency in visuals

> Note: `Day Name` and `Month Name` are derived from `order_date` in Power BI.

---

# 📊 4) Key Measures (Power BI / DAX)

These measures power KPIs, trends, and drill-through analysis.

---

## 🔹 Core KPIs

```DAX
Total Revenue = SUM(pizza_sales[total_price])
```

```DAX
Total Orders = DISTINCTCOUNT(pizza_sales[order_id])
```

```DAX
Total Pizzas Sold = SUM(pizza_sales[quantity])
```

---

## 🔹 Derived Metrics

```DAX
Avg Order Value = DIVIDE([Total Revenue],[Total Orders])
```

```DAX
Avg Pizzas per Order = DIVIDE([Total Pizzas Sold], [Total Orders])
```

---

## 🔹 Time Intelligence

```DAX
Previous Month Revenue = 
CALCULATE(
    [Total Revenue],
    DATEADD(DateTable[Date], -1, MONTH)
)
```

```DAX
MoM Growth % = 
DIVIDE(
    [Total Revenue] - [Previous Month Revenue],
    [Previous Month Revenue]
)
```

```DAX
Running Revenue = 
CALCULATE(
    [Total Revenue],
    FILTER(
        ALL(DateTable),
        DateTable[Date] <= MAX(DateTable[Date])
    )
)
```

```DAX
Running Orders = 
CALCULATE(
    [Total Orders],
    FILTER(
        ALL(DateTable),
        DateTable[Date] <= MAX(DateTable[Date])
    )
)
```

---

## 🔹 Drill-Through Enhancement

```DAX
Selected Pizza = 
"Detailed Analysis: " & SELECTEDVALUE(pizza_sales[pizza_name])
```

**Purpose:** Creates dynamic titles for the drill-through page.

---

# 🧠 Notes & Assumptions

- The dataset is at **transaction line-item level**, not aggregated.
- `order_id` can repeat across multiple rows.
- `total_price` is pre-calculated (not derived in Power BI).
- Time-based analysis depends on the relationship between:
  - `DateTable[Date]` → `pizza_sales[order_date]`

---

# 📌 Summary

This data model supports:
- Revenue and order analysis
- Product performance evaluation
- Time-based trend analysis
- Interactive drill-through exploration

The combination of a clean SQL source table and a well-structured Power BI model enables scalable and reliable business insights.

