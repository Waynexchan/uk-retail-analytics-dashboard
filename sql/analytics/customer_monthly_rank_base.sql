WITH monthly_customer AS (
SELECT  
  FORMAT_DATE('%Y-%m', month) AS month,
  customer_id,
  SUM(revenue) AS total_revenue
  
FROM `uk-retail-project.UkRetail.fact_sales_net` 
WHERE customer_id != 'UNKNOWN'
GROUP BY 1, 2
)
SELECT
  month,
  customer_id,
  total_revenue,
  ROW_NUMBER() OVER(PARTITION BY month ORDER BY total_revenue DESC) AS revenue_rank 
FROM monthly_customer
ORDER BY total_revenue DESC, customer_id