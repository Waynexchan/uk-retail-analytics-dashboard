With ranked AS (
SELECT  
  StockCode,
  revenue,
  revenue_share,
  ROW_NUMBER() OVER (ORDER BY revenue DESC) AS rn
FROM `uk-retail-project.UkRetail.product_overall_pareto_base` 


)
SELECT 
  SUM(revenue_share) AS top10_contribution_revenue
FROM ranked
WHERE rn <= 10