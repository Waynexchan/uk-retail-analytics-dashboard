WITH customer_base AS (

SELECT  
  customer_id,
  SUM(revenue) AS customer_revenue


FROM `uk-retail-project.UkRetail.fact_sales_net` 
WHERE customer_id != 'UNKNOWN'
GROUP BY customer_id
) , Ranked AS (
  SELECT 
  customer_id,
  customer_revenue,
  SUM(customer_revenue) OVER() AS total_revenue,
  ROW_NUMBER() OVER (ORDER BY customer_revenue DESC) AS customer_rank
  FROM customer_base
) SELECT
  customer_id,
  customer_revenue,
  total_revenue,
  customer_rank,
  SAFE_DIVIDE(customer_revenue, total_revenue) AS revenue_share,
  SUM(SAFE_DIVIDE(customer_revenue, total_revenue)) OVER (ORDER BY customer_rank) AS cumulative_share
  FROM Ranked
