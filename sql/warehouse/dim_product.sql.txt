SELECT  
  StockCode,
  ANY_VALUE(TRIM(Description)) AS description
FROM `uk-retail-project.UkRetail.uk_retail_cleaned`
WHERE StockCode IS NOT NULL AND Description IS NOT NULL 
GROUP BY StockCode