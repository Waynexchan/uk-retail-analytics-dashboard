-- ============================================================
-- Query: kpi_monthly_summary
--
-- Purpose:
-- Produce monthly sales KPIs for the Power BI Sales Overview.
--
-- Grain:
-- One row per calendar month.
--
-- Output fields:
-- month, revenue, orders, customers, units, aov
--
-- Source:
-- UkRetail.fact_sales_net
--
-- Used by:
-- Power BI - Sales Overview page
--
-- Notes:
-- Customer count represents unique customers within each month.
-- Adding monthly customer counts across multiple months does not
-- produce a true period-level distinct customer count.
-- ============================================================
WITH invoice_base AS (
  SELECT
    DATE_TRUNC(month, MONTH) AS month_dt,
    Invoice,
    ANY_VALUE(NULLIF(customer_id, 'UNKNOWN')) AS customer_id,
    SUM(revenue) AS invoice_revenue,
    SUM(Quantity) AS invoice_units
  FROM `uk-retail-project.UkRetail.fact_sales_net`
  GROUP BY 1, 2
)

SELECT
  FORMAT_DATE('%Y-%m', month_dt) AS month,
  SUM(invoice_revenue) AS revenue,
  COUNT(*) AS orders,
  COUNT(DISTINCT customer_id) AS customers,
  SUM(invoice_units) AS units,
  SAFE_DIVIDE(SUM(invoice_revenue), COUNT(*)) AS aov
FROM invoice_base
GROUP BY 1
ORDER BY 1