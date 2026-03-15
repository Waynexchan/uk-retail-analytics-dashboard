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