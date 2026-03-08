WITH return_base AS (
SELECT  
  FORMAT_DATE('%Y-%m', month) AS month,
  SUM(CASE WHEN is_return = 1 THEN ABS(revenue) ELSE 0 END) AS return_revenue,
  SUM(CASE WHEN is_return = 0 AND  revenue > 0 THEN revenue ELSE 0 END) AS sales_revenue,
  COUNT(DISTINCT IF(is_return = 1, Invoice, NULL)) AS return_orders,
  COUNT(DISTINCT IF(is_return = 0 AND revenue > 0, Invoice, NULL)) AS sales_orders,
  COUNT(DISTINCT Invoice) AS total_orders
FROM `uk-retail-project.UkRetail.fact_sales_line` 
GROUP BY 1
) 
SELECT 
  month,
  return_revenue,
  sales_revenue,
  SAFE_DIVIDE(return_revenue, sales_revenue) AS return_rate_amount,
  return_orders,
  sales_orders,
  total_orders,
  SAFE_DIVIDE(return_orders, sales_orders) AS return_rate_qty_vs_sales,
  SAFE_DIVIDE(return_orders, total_orders) AS return_rate_qty_vs_total

FROM return_base
ORDER BY month