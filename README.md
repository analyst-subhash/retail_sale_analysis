# 🛒 Retail Sales Analysis using SQL

## 📌 Project Overview

This project analyzes retail transaction data to uncover business insights related to revenue, profitability, customer behavior, seasonality, and operational efficiency.

The analysis goes beyond basic reporting and answers key business questions:

- 💰 What drives revenue and profit?
- 📦 Which categories perform best, and why?
- 👥 How does customer behavior impact business performance?
- 📈 Is growth sustainable or mainly seasonal?
- ⚙️ Where are the inefficiencies in cost, pricing, or product mix?

## 🎯 Objective

The goal of this project is to transform raw retail transaction data into meaningful insights that can help businesses:

- 💵 Improve profitability
- 🏷️ Optimize pricing and cost structure
- 👤 Identify high-value customer segments
- 📅 Prepare for seasonal demand
- ⚡ Improve operational efficiency

## 🧰 Tools and Technologies

- 🐘 PostgreSQL
- 🧮 SQL
- 🔗 CTEs
- 🪟 Window functions
- 📊 Aggregations
- 📈 Power BI, optional for visualization

## 📊 Dataset Description

The dataset contains retail transaction-level records with the following fields:

- 🧾 Transaction ID
- 🕒 Sale date and time
- 👤 Customer ID
- 🚻 Gender
- 🎂 Age
- 🛍️ Category
- 🔢 Quantity
- 🏷️ Price per unit
- 🧾 Cost of goods sold, COGS
- 💰 Total sale

## 🧮 Core Business KPIs

| Metric | Value |
| --- | ---: |
| Total Revenue | 908,230 |
| Total Cost | 486,861.05 |
| Total Profit | 421,368.95 |
| Profit Margin | 46% |
| Total Orders | 1,987 |
| Total Quantity Sold | 4,995 |
| Avg Items per Order | ~2 |
| Avg Selling Price | 181.83 |
| Avg Cost | 97.47 |
| Avg Margin per Unit | 84.36 |
| Total Customers | 155 |
| Revenue per Customer | 5,859.55 |

## 🔍 KPI Insights

- ✅ The business maintains a strong profit margin of around 46%, showing a healthy overall pricing and cost structure.
- 💪 Average margin per unit is 84.36, which indicates strong unit-level profitability.
- ⚠️ Revenue per customer is high at 5,859.55, but the customer base is limited to 155 customers, creating dependency risk.

## 📦 Category Performance Analysis

| Category | Revenue | Profit | Cost | Margin | Orders |
| --- | ---: | ---: | ---: | ---: | ---: |
| 🧴 Beauty | 286,790 | 137,441.80 | 149,348.20 | 47.92% | 611 |
| 👕 Clothing | 309,995 | 143,236.30 | 166,758.70 | 46.21% | 698 |
| 📱 Electronics | 311,445 | 140,690.85 | 170,754.15 | 45.17% | 678 |

### 🧴 Beauty: High Margin, Low Volume

Beauty has the highest margin at 47.92% and the lowest cost base, but it also has the lowest order volume.

👉 **Insight:** Beauty is a high-margin but underutilized category, indicating strong profitability but limited demand.

🚀 **Recommended actions:**

- Increase category visibility through marketing
- Promote premium positioning
- Use upselling and product bundling

### 👕 Clothing: Balanced Performer

Clothing generates the highest profit and has the highest order count, with a moderate profit margin.

👉 **Insight:** Clothing is the most stable and balanced category, driven by strong order volume.

🚀 **Recommended actions:**

- Improve average order value
- Introduce bundled offers
- Upsell higher-priced products

### 📱 Electronics: High Revenue, Cost-Heavy

Electronics generates the highest revenue but also has the highest cost and the lowest profit margin.

👉 **Insight:** Electronics is a high-revenue but cost-intensive category where profitability is limited by cost structure.

🚀 **Recommended actions:**

- Optimize supplier costs
- Improve product mix
- Reduce unnecessary discounting

## 🔥 Strategic Category Positioning

| Category | Business Role |
| --- | --- |
| 🧴 Beauty | High-margin growth driver |
| 👕 Clothing | Stable volume engine |
| 📱 Electronics | Revenue driver with cost sensitivity |

## 📅 Monthly Trend Analysis

### 🔎 Key Observations

- Revenue remains relatively stable from January to August, generally between 40K and 58K.
- Revenue sharply increases from September to December, reaching up to 141K.
- The pattern repeats across years, showing strong seasonality.

### 📈 Growth Highlights

- September 2022 revenue growth: +192%
- September 2023 revenue growth: +139%

### 💡 Insights

- Most revenue is generated in Q4.
- The business is heavily seasonal.
- Demand is predictable and recurring.

### 🎯 Recommended Actions

- Launch pre-season marketing campaigns.
- Stock inventory before September.
- Plan workforce capacity for peak demand.

## 📊 Month-over-Month Analysis

### ⚠️ Revenue vs Profit Gap

Revenue growth does not always translate into profit growth.

Examples:

- 📍 October 2022: Revenue increased by 9.9%, while profit decreased by 23.6%.
- 📍 October 2023: Revenue decreased by 14%, while profit decreased by 31%.

👉 **Insight:** Margin pressure affects profitability even when revenue performance appears strong.

### ⚡ Volume-Driven Growth

- September 2022: Revenue increased by 192%, while profit increased by 110%.
- September 2023: Revenue increased by 139%, while profit increased by 57%.

👉 **Insight:** Growth is mainly volume-driven, not margin-driven.

### 🔻 Post-Season Drop

- January 2023: Revenue decreased by 66.9%, while profit decreased by 51.7%.

👉 **Insight:** The business has a strong dependency on peak-season sales.

### 📉 Stable Period

April to August represents the baseline business performance period, with relatively steady revenue and profit.

## ⏰ Hourly Trend Analysis

### 🔎 Key Observations

- Sales increase from 5 PM onward.
- Peak sales occur between 6 PM and 9 PM.
- The highest order activity occurs between 7 PM and 8 PM.

### 💡 Insights

- A large share of daily revenue comes from evening hours.
- This indicates strong post-work shopping behavior.

### 🎯 Recommended Actions

- Increase staffing during peak hours.
- Optimize checkout operations.
- Ensure stock availability during evening demand.

## 👥 Customer Analysis by Age Group

| Age Group | Revenue | Profit |
| --- | ---: | ---: |
| 18-25 | 168,960 | 82,186 |
| 25-45 | 380,535 | 173,125 |
| 45+ | 358,735 | 166,056 |

### 💡 Insights

- The 25-45 age group is the primary revenue and profit driver.
- Customers aged 45+ contribute nearly the same amount as the 25-45 group.
- The 18-25 segment has the lowest contribution.

### 🎯 Recommended Actions

- Target the 25-45 segment for growth.
- Expand focus on the 45+ customer segment.
- Offer affordable options for younger customers.

## 👨‍👩‍👧 Gender Analysis

| Gender | Revenue | Profit | Orders | AOV |
| --- | ---: | ---: | ---: | ---: |
| Female 👩 | 463,110 | 197,403 | 1,012 | ~457 |
| Male 👨 | 445,120 | 223,965 | 975 | ~456 |

### 💡 Insights

- Female customers show higher engagement through more orders and higher total revenue.
- Male customers generate higher total profit.
- Average order value is almost equal across both groups.

### 🎯 Recommended Strategy

- Use volume-focused campaigns for female customers.
- Use profit-focused targeting for male customers.

## 🧠 Key Business Insights

1. The business is highly seasonal, with Q4 dominating revenue.
2. Revenue growth does not always lead to profit growth.
3. Electronics profitability is constrained by high costs.
4. Beauty has high margin but low demand, making it a growth opportunity.
5. Clothing is stable, balanced, and volume-driven.
6. The customer base is small, creating dependency risk.
7. Evening hours drive a large share of sales activity.

## 🚀 Final Conclusion

This analysis shows that high revenue alone does not guarantee strong business performance. Profitability depends heavily on cost structure, product mix, customer behavior, and seasonal demand.

The business has strong overall margins, but it also faces risks from customer concentration, Q4 seasonality, and cost-heavy electronics sales. By improving category-level strategy, preparing for seasonal peaks, and targeting high-value customer segments, the business can improve both growth and profitability.

## 📌 Future Scope

- Customer lifetime value analysis
- Cohort analysis
- Product-level profitability
- Sales forecasting models
- Discount impact analysis
- Power BI dashboard development

## 📁 Project Files

| File | Description |
| --- | --- |
| `data/retail.csv` | Retail transaction dataset |
| `sql/retail.sql` | SQL queries used for analysis |
| `reports/retail_sales_analysis_report.md` | Formal business analysis report |
| `README.md` | Project documentation and business insights |

## 🙌 Learning Outcome

This project demonstrates how raw transactional data can be converted into structured SQL analysis and then translated into practical business decisions.
