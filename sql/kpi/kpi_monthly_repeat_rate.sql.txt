WITH month_base AS (
SELECT 
  FORMAT_DATE('%Y-%m', month) AS month,
  customer_id,
  COUNT(DISTINCT Invoice) AS orders_per_customer
FROM `uk-retail-project.UkRetail.fact_sales_net` 
WHERE customer_id != 'UNKNOWN'
GROUP BY 1, 2
), 
  repeated AS (
  SELECT
  month,
  COUNT(customer_id) AS total_customers,
  COUNTIF (orders_per_customer >= 2) AS repeated_customers
  
  FROM month_base
  GROUP BY month
  ) 
  SELECT
    month,
    total_customers,
    repeated_customers,
    SAFE_DIVIDE(repeated_customers, total_customers) AS repeat_rate

  FROM repeated