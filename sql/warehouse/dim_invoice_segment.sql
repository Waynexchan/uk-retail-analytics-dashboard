SELECT  
  month,
  Invoice,
  customer_id,
  invoice_revenue,
  invoice_units,
  CASE WHEN invoice_revenue >= 50000 THEN 'B2B' ELSE 'Retail' END AS segment

FROM `uk-retail-project.UkRetail.fact_invoice_net`