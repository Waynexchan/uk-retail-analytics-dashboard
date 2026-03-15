WITH prod AS (
SELECT  
  f.StockCode,
  SUM(revenue) AS product_revenue
FROM `uk-retail-project.UkRetail.fact_sales_net` f
LEFT JOIN `uk-retail-project.UkRetail.ref_excluded_stockcode` x
  ON f.StockCode = x.StockCode
WHERE x.StockCode IS NULL
GROUP BY StockCode
) ,
 ranked AS (
SELECT 
  StockCode,
  product_revenue,
  SUM(product_revenue) OVER () AS total_revenue,
  ROW_NUMBER() OVER(ORDER BY product_revenue DESC) AS product_rank
FROM prod
)
SELECT 
  t.StockCode,
  p.description,
  t.product_revenue,
  t.product_rank,
  SAFE_DIVIDE(t.product_revenue, t.total_revenue) AS revenue_share,
  SUM(SAFE_DIVIDE(t.product_revenue, t.total_revenue)) OVER(ORDER BY t.product_rank) AS cumulative_share
  
FROM ranked t
LEFT JOIN `uk-retail-project.UkRetail.dim_product` p
ON t.StockCode = p.StockCode