WITH prod_month AS (
SELECT  
  FORMAT_DATE('%Y-%m', s.month) AS month,
  s.StockCode,
  SUM(revenue) AS revenue
FROM `uk-retail-project.UkRetail.fact_sales_net` s
LEFT JOIN `uk-retail-project.UkRetail.ref_excluded_stockcode` e
ON s.StockCode = e.StockCode
WHERE e.StockCode IS NULL
GROUP BY 1,2
), 
  ranked AS (
SELECT
  month,
  StockCode,
  revenue,
  SAFE_DIVIDE(revenue, SUM(revenue) OVER (PARTITION BY month)) AS revenue_share,
  ROW_NUMBER() OVER(PARTITION BY month ORDER BY revenue DESC) AS revenue_rank
FROM prod_month
  )
  SELECT
  month,
  SUM(revenue_share) AS top10_share
  FROM ranked
  WHERE revenue_rank <= 10
  GROUP BY 1
  ORDER BY 1