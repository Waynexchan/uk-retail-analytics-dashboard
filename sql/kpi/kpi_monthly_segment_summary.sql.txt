SELECT  
  month,
  segment,
  COUNT(DISTINCT Invoice) AS invoices,
  COUNT(DISTINCT customer_id) AS customers_qty,
  SUM(invoice_revenue) AS segment_revenue,
  SUM(invoice_units) AS segment_unit
FROM `uk-retail-project.UkRetail.dim_invoice_segment`
GROUP BY month, segment
ORDER BY month, segment