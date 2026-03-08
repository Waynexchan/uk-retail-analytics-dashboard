WITH cumu AS (
SELECT  
  StockCode,
  description,
  revenue,
  revenue_share,
  SUM(revenue_share) OVER(ORDER BY revenue DESC) AS cumulative_share
FROM `uk-retail-project.UkRetail.product_overall_pareto_base` 
)
  SELECT
    COUNTIF(cumulative_share <= 0.8) AS num_to_reach_80pct,
    COUNT(*) AS total_products,
    SAFE_DIVIDE(COUNTIF(cumulative_share <= 0.8), COUNT(*)) AS pct_prducts_needed
  FROM cumu