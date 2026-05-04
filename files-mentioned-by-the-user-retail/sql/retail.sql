select * from retail_enriched

---checking nulls
select * from retail_sales
where transaction_id is null or
	sale_date is null or
	sale_time is null or
	customer_id is null or
	gender is null or
	age is null or
	quantity is null or
	category is null or
	price_per_unit is null or
	cogs is null or
	total_sale is null
	
--checking duplicates
select transaction_id,count(transaction_id) from retail_sales
group by transaction_id
having count(transaction_id)>1

---Creating View----------------------------------
create view retail_enriched as
select transaction_id,
		sale_date,
		sale_time,
		customer_id,
		gender,
		age,
		category,
		quantity,
		total_sale,
		cogs*quantity as total_cost,
		total_sale-(cogs*quantity) as profit 
from retail_sales

-----------------------------------🧮 Core KPIs:-----------------------------------------------

--Total Revenue
select 'Revenue' as measure,sum(total_sale) as value from retail_sales
union all

--Total Cost
select 'Total Cost' as measure,round(sum(total_cost)::numeric,2) from retail_enriched
union all

--Total Profit
select 'Total Profit' as measure,round(sum(profit)::numeric,2) from retail_enriched
union all

--Profit Margin
select 'Profit Margin' as measure,round(sum(profit)::numeric/sum(total_sale)::numeric,2) as profit_margin from retail_enriched
union all

--Total orders
select 'Total orders' as measure, count(*) as total_orders from retail_enriched
union all

--total quantity sold
select 'Total Quantity Sold' as measure, sum(quantity ) as quantity_sold from retail_enriched
union all

--average items per order
select 'Average Items Per Order' as measure,sum(quantity)/count(distinct transaction_id) as average_items_per_order from retail_enriched
union all

--average selling price
select 'Average Selling Price' as measure,round(sum(total_sale)::numeric/sum(quantity),2) as avg_selling_price from retail_enriched
union all

--average cost
select 'Average Cost' as measure, round(sum(total_cost)::numeric/sum(quantity),2) as avg_cost from retail_enriched
union all

--average margin per unit
select 'Average Margin Per Unit' as Measure, round((sum(profit))::numeric/sum(quantity),2) as avg_margin_per_unit from retail_enriched
union all

--Total_customers
select 'Total Customers' as measure, count(distinct customer_id) as total_customers from retail_enriched
union all

--Revenue per customer
select 'Revenue Per Customer' as measure, round(sum(total_sale)::numeric/count(distinct customer_id),2) as revenue_per_customer from retail_enriched

-------------------------------------------KPI Insights----------------------------------------------
--The business is highly profitable with a strong overall margin of ~46%, indicating a healthy pricing strategy and effective cost control at an aggregate level.
--Each unit sold generates a strong average margin (~84), meaning the business has solid unit-level profitability and pricing power.
--Customers typically purchase around 2 items per transaction, indicating low-to-moderate basket size and potential for upselling or bundling strategies.
--Revenue is concentrated among a relatively small customer base, with high average revenue per customer (~5859), indicating strong customer value but potential dependency risk. if some customer does'nt order revenue drops heavily.


-------------------------------------------Business Analysis--------------------------------------------

--Category Performance
select category,round((sum(profit)*100/sum(total_sale))::numeric,2) as profit_margin,
		sum(total_sale) as revenue_per_category,
		round(sum(profit)::numeric,2) as profit_per_category,
		round(sum(total_sale)::numeric/sum(quantity),2) as avg_selling_price,
		round((sum(profit))::numeric/sum(quantity),2) as avg_margin_per_unit,
		round(SUM(total_sale)::numeric * 100.0 / SUM(SUM(total_sale)::numeric) OVER (),2) as revenue_contribution,
		count(distinct transaction_id) as order_count,
		round(sum(total_cost)::numeric,2) as total_cost
from retail_enriched
group by category
--Beauty category has highest profit margin, also cost effective, low revenue because of count of order, suggests increased visibility through marketing, promote premium positioning
--Electronics has highest revenue but revenue is because of higher cost, as a result lowest profit margin, suggest inventory management, supplier cost optimization.
--clothing category has highest number of order, but slighly low profit margin, avg selling price is lowest as well, suggest effective pricing starategy and improve average order value. overall balanced Category with strong order count.

--Monthly Trend
select extract(month from sale_date) as month_,sum(total_sale) as revenue from retail_enriched
group by extract(month from sale_date)
order by month_
/*Insight: Revenue looks pretty normal from Jan to Aug, no big jumps there, just small ups and downs.
 But from September onwards it suddenly spikes a lot, almost 2x compared to previous months, and stays high till December.
 this same pattern is visible across years also, so it’s not random, it clearly shows the business is seasonal.
 Most of the revenue is coming in Q4, so company should be more prepared in that period — like better inventory planning, more staff, and focused marketing before the season starts.
 */

 
--Hourly Trend
select extract(hour from sale_time) as hour_, sum(total_sale) as revenue, count(distinct transaction_id) as order_count from retail_enriched
group by extract(hour from sale_time)
order by hour_
/*Insight: Sales stay fairly normal throughout the day, but from around 5 PM there is a sudden spike in both revenue and order count.

The peak happens between 6 PM to 9 PM, with the highest activity around 7–8 PM.
After that, it starts dropping again.

This clearly shows that most customers prefer shopping in the evening hours, likely after work.

So the business should focus on better inventory availability and staffing during this time window (5 PM – 10 PM) to handle peak demand efficiently.
*/

select extract(year from sale_date) as year_,extract(month from sale_date) as month_,sum(total_sale) as revenue from retail_enriched
group by extract(year from sale_date),extract(month from sale_date)
order by year_,month_

--Customer Analysis
select case 
		when age between 18 and 25 then 'Young(18-25)'
		when age between 25 and 45 then 'Young Professional(25-45)'
		else 'Senior(above 45)' End as age_group,
		sum(total_sale) as revenue,
		round(sum(profit)::numeric,2) as profit
from retail_enriched
group by age_group
-- Insight 1:
-- Customers aged 25–45 generate the highest revenue and profit,
-- making them the primary target segment.

-- Insight 2:
-- The senior segment (45+) contributes nearly equal revenue,
-- indicating strong purchasing power and an important secondary segment.

-- Insight 3:
-- The 18–25 segment contributes the least,
-- suggesting lower purchasing power or engagement.

-- Insight 4:
-- Revenue is well distributed across age groups,
-- reducing dependency on a single customer segment.

-- Insight 5:
-- Senior customers perform almost as strongly as mid-age customers,
-- indicating opportunity for broader targeting strategies.


--Revenue By Gender
select gender,sum(total_sale) as revenue,sum(profit) as profit,count(distinct transaction_id) as order_count,sum(total_sale)/count(distinct transaction_id) as AOV
from retail_enriched
group by gender
-- Insight 1:
-- Female customers generate higher revenue and order volume,
-- indicating stronger engagement and purchase frequency.

-- Insight 2:
-- Male customers generate higher total profit despite lower revenue,
-- suggesting more profitable purchasing behavior.

-- Insight 3:
-- Average order value is nearly identical across genders,
-- indicating similar spending per transaction.

-- Insight 4:
-- Male customers appear more profit-efficient,
-- likely due to higher-margin product purchases or lower discounting.

-- Insight 5:
-- Both segments are important: females drive volume,
-- while males contribute stronger profitability.


--MoM Analysis
WITH monthly_data AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_,
        SUM(total_sale) AS revenue,
        SUM(profit) AS profit
    FROM retail_enriched
    GROUP BY 1
),

lagged AS (
    SELECT 
        *,
        LAG(revenue) OVER (ORDER BY month_) AS previous_month_revenue,
        LAG(profit) OVER (ORDER BY month_) AS previous_month_profit
    FROM monthly_data
)

SELECT 
    month_,
    revenue,
    profit,

    -- Revenue MoM Growth %
    ROUND(
        (
            (revenue - previous_month_revenue) * 100.0 
            / NULLIF(previous_month_revenue, 0)
        )::numeric,
        2
    ) AS mom_revenue_growth_pct,

    -- Profit MoM Growth %
    ROUND(
        (
            (profit - previous_month_profit) * 100.0 
            / NULLIF(previous_month_profit, 0)
        )::numeric,
        2
    ) AS mom_profit_growth_pct,

    -- Cumulative Revenue
    SUM(revenue) OVER (ORDER BY month_) AS cumulative_revenue,

    -- 3-Month Moving Average Revenue
    ROUND(
        AVG(revenue) OVER (
            ORDER BY month_
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        )::numeric,
        2
    ) AS moving_avg_3m

FROM lagged
ORDER BY month_;

/*
MoM Insights:

- Sales remain stable for most of the year, but spike suddenly from September to December,
  showing business is season based

- In some months (especially October), revenue increases but profit declines,
  indicating margin pressure due to cost or discounting.

- During peak months, revenue grows faster than profit,
  suggesting volume-driven growth rather than margin-driven growth.

- A sharp drop is observed after peak season (January),
  showing heavy dependency on seasonal demand. Suggested to focus also on non peak season

- Mid-year performance remains stable, representing the baseline business level.
*/