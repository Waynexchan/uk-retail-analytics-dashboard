SELECT  
  Invoice,
  FORMAT_DATE('%Y-%m',month) AS month,
  customer_id,
  SUM(revenue) AS invoice_revenue,
  SUM(Quantity) AS invoice_units

FROM `uk-retail-project.UkRetail.fact_sales_net`
GROUP BY 1,2,3