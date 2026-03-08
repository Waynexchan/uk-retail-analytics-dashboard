SELECT  
  CAST(Customer_ID AS STRING) AS customer_id,
  ANY_VALUE(Country) AS country

FROM `uk-retail-project.UkRetail.uk_retail_cleaned`
WHERE Customer_ID IS NOT NULL
GROUP BY customer_id